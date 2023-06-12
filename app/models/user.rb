class User < ApplicationRecord
  has_one :employee, dependent: :destroy
  has_and_belongs_to_many :events, after_add: :send_remainder_email

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  after_create :generate_employee_record

  private

  def send_remainder_email(event)
    remainder_time = (event.eventdate.to_time - 5.hours).to_datetime
    RemainderEmailJob.set(wait_until: remainder_time).perform_later(event)
  end

  def send_welcome_email
    WelcomeEmailJob.perform_now(self)
  end

  def generate_employee_record
    GenerateEmployeeRecordJob.set(wait: 2.minutes).perform_later(id)
  end
end

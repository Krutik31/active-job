class GenerateEmployeeRecordJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    employee = Employee.new(name: user.name, email: user.email,
                            company: Faker::Company.name, designation: Faker::Job.title, user_id: user.id)
    employee.save
  end
end

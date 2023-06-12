class RemainderEmailJob < ApplicationJob
  queue_as :default

  def perform(event)
    UserMailer.with(event:).remainder_email.deliver_now
  end
end

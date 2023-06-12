class SendEventsEmailJob
  include Sidekiq::Job

  def perform
    @users = User.all

    @users.each do |user|
      @events = Event.where.not(id: user.events)
      @enrolled_events = user.events
      UserMailer.with(user:, events: @events, enrolled_events: @enrolled_events).events_list_email.deliver_now
    end
  end
end

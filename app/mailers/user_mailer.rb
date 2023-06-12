class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome Folk')
  end

  def events_list_email
    @user = params[:user]
    @events = params[:events]
    @enrolled_events = params[:enrolled_events]
    mail(to: @user.email, subject: 'Events list')
  end

  def remainder_email
    @event = params[:event]
    emails = @event.users.pluck(:email)
    mail(to: emails, subject: "Remainder for #{@event.title}")
  end
end

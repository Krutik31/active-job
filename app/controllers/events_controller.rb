class EventsController < ApplicationController
  before_action :fetch_user
  before_action :fetch_event, only: %i[show enroll]

  def index
    @events = Event.where.not(id: @user.events).where(eventdate: (DateTime.now + 5.hours)..)
  end

  def show; end

  private

  def fetch_event
    @event = Event.find(params[:id])
  end

  def fetch_user
    @user = User.find(params[:user_id])
  end
end

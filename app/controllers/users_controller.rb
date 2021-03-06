class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @created_events = @user.events.order(created_at: :desc)
    attending_events = Event.joins(:event_attendances).where("event_attendances.attendee_id = #{@user.id}")
    @past_events = attending_events.past
    @upcoming_events = attending_events.upcoming
  end
end

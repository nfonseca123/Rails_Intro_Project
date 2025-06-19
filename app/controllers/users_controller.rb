class UsersController < ApplicationController
  def index
    @states = State.includes(:country).all
    @selected_state = params[:state_id]

    @users = User.includes(state: :country)
    @users = @users.where(state_id: @selected_state) if @selected_state.present?
  end
end
class UsersController < ApplicationController
  def index
    @states = State.includes(:country).all
    @selected_state = params[:state_id]
    @query = params[:query]

    @users = User.includes(state: :country)
    @users = @users.where(state_id: @selected_state) if @selected_state.present?
    @users = @users
    .joins(state: :country)
    .where("users.first_name LIKE :q OR users.last_name LIKE :q OR users.email LIKE :q OR users.phone_number LIKE :q OR states.name LIKE :q OR countries.name LIKE :q",
      q: "%#{@query}%"
    ) if @query.present?
  end

  def show
    @user = User.find(params[:id])
  end

end
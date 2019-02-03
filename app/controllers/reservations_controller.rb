class ReservationsController < ApplicationController
  before_action :authenticate_user,  only: [:create]
  before_action :authenticate_rest,  only: [:show]

  def create
    restaurant = Restaurant.by_reserv(reserv_params.delete(:table_id),reserv_params.delete(:shift_id))
    reservation = restaurant.build(reserv_params)
  end

  private

  def reserv_params
    @reserv_params = params.require(:reservation).permit(:start_at, :end_at, :guest_count)
    @reserv_params['user_id'] = @current_user.id
    @reserv_params
  end
end

class RestaurantsController < ApplicationController
  before_action :authenticate_rest,  only: %i[add_shift add_table reservations]

  def create
    restaurant = current_class.new(basic_params(:restaurant))
    begin
      if restaurant.save
        render json: { success: true, status: 200, message: 'Restaurant was created!'}
      else
        json_error_response('Create failed', restaurant.errors.messages)
      end
    rescue Exception => e
      render json: { success: true, status: 200, message: e }
    end
  end

  def add_shift
    shift = @restaurant.shifts.build(basic_params(:shift))
    if shift.save
      render json: { success: true, status: 200, message: 'Shift was created!'}
    else
      json_error_response('Create shift failed', shift.errors.messages)
    end
  end

  def add_table
    table = @restaurant.tables.build(basic_params(:table))
    if table.save
      render json: { success: true, status: 200, message: 'Table was created!'}
    else
      json_error_response('Create table failed', table.errors.messages)
    end
  end

  def reservations
    render json: { success: true, status: 200,
                   reservations: ReservationBlueprint.render_as_hash(@restaurant.reservations.includes(:table, :user))}
  end

  private

  def authenticate_rest
    @restaurant = current_class.find_by(token: request.headers['RestToken'])
    json_error_response('Not Authorized Restaurant', {}, 401) unless @restaurant
  end

  def basic_params(type)
    params.require(type).permit(*self.send("#{type}_attributes"))
  end

  def restaurant_attributes
    %i[name email phone_number]
  end

  def shift_attributes
    %i[name start_time end_time]
  end

  def table_attributes
    %i[name min_guest max_guest]
  end

  def current_class
    Restaurant
  end
end

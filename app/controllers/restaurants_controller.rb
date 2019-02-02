class RestaurantsController < ApplicationController
  before_action :authenticate_rest,  only: %i[add_shift add_table reservation]

  def create
    restaurant = current_class.new(basic_params(:restaurant))
    if restaurant.save
      render json: { success: true, status: 200, message: 'Restaurant was created!'}
    else
      json_error_response('Create failed', restaurant.errors.messages)
    end
  end

  def add_shift
    shift = @restaurant.shifts.build(basic_params(:shift))
    if shift.save!
      render json: { success: true, status: 200, message: 'Shift was created!'}
    else
      json_error_response('Create Shift', shift.errors.messages)
    end
  end

  def add_table
    table = @restaurant.tables.build(basic_params(:table))
    if table.save!
      render json: { success: true, status: 200, message: 'Table was created!'}
    else
      json_error_response('Create table', table.errors.messages)
    end
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

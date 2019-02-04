class RestaurantBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :email
  association :reservations, blueprint: ReservationBlueprint
end

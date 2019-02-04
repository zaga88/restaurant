class ReservationBlueprint < Blueprinter::Base
  identifier :id

  field :guest_count
  field :start_at, datetime_format: '%H:%M %m/%d/%Y'
  field :end_at, datetime_format: '%H:%M %m/%d/%Y'
  association :user, blueprint: UserBlueprint
  association :table, blueprint: TableBlueprint
end

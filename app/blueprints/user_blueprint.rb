class UserBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :email
  field :last_login, datetime_format: '%H:%M %m/%d/%Y'
end

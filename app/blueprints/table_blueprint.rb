class TableBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :min_guest, :max_guest
end

class StructureItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :ident, :description, :created_at
end

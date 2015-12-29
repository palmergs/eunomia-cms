class StructureRelation < ApplicationRecord

  belongs_to :parent, class_name: 'StructureItem', foreign_key: :parent_id, primary_key: :id
  belongs_to :child, class_name: 'StructureItem', foreign_key: :child_id, primary_key: :id

end

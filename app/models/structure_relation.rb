# `StructureItems` can be reused under other structures. To implement this, 
# the structure tree is a many-to-many relationship between the parent item and
# a child item.
class StructureRelation < ApplicationRecord

  belongs_to :parent, class_name: 'StructureItem', foreign_key: :parent_id, primary_key: :id
  belongs_to :child, class_name: 'StructureItem', foreign_key: :child_id, primary_key: :id

end

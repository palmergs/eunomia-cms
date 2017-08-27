# A content item is information that matches the pattern defined by the required `StructureItem`. 
# It will have a parent if the `StructureItem` has a parent.  It may have children if the 
# related structure allows for children. It is valid if its children match the required
# children defined by its structure.
class ContentItem < ApplicationRecord

  belongs_to :structure_item

  belongs_to :parent, 
      class_name: 'ContentItem', 
      foreign_key: :parent_id,
      primary_key: :id, 
      optional: true

  has_many :children, 
      class_name: 'ContentItem', 
      foreign_key: :parent_id, 
      primary_key: :id

end

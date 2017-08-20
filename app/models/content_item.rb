class ContentItem < ApplicationRecord

  belongs_to :structure_item

  belongs_to :parent, class_name: 'ContentItem', foreign_key: :parent_id, primary_key: :id, optional: true
  has_many :children, class_name: 'ContentItem', foreign_key: :parent_id, primary_key: :id

end

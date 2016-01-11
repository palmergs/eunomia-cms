require 'slug_support'

class StructureItem < ApplicationRecord

  has_many :content_items

  has_many :parent_relations, class_name: 'StructureRelation', foreign_key: :parent_id, primary_key: :id
  has_many :child_relations, class_name: 'StructureRelation', foreign_key: :child_id, primary_key: :id

  before_save do
    self.ident = SlugSupport.slugify(self.name)
  end

end

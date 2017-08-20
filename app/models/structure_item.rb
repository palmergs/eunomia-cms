require 'slug_support'

class StructureItem < ApplicationRecord

  has_many :content_items

  has_many :parent_relations, 
      class_name: 'StructureRelation', 
      foreign_key: :parent_id, 
      primary_key: :id
  has_many :available_parents, 
      class_name: 'StructureItem', 
      through: :parent_relations

  has_many :child_relations, 
      class_name: 'StructureRelation', 
      foreign_key: :child_id, 
      primary_key: :id
  has_many :available_children, 
      class_name: 'StructureItem', 
      through: :child_relations


  before_save do
    self.ident = SlugSupport.slugify(self.name)
  end

end

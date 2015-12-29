class InlineItem < ApplicationRecord

  belongs_to :structure_item

  has_many :inline_refs

end

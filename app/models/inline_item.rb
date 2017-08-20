# An `InlineItem` identifies a `StructureItem` that can be linked 
# to from text. For example, a `SequenceItem` might represent a block
# of example text.  This structure defines how the link TOO the example 
# text is defined.
class InlineItem < ApplicationRecord

  belongs_to :structure_item

  has_many :inline_refs

end

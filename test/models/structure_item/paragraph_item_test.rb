require 'test_helper'

class StructureItem::ParagraphItemTest < ActiveSupport::TestCase
  test "creation" do
    assert si = StructureItem::ParagraphItem.create({ name: "Default Text", description: "A standard book paragraph" })
    assert si.ident == "default-text"
    assert si.type == "StructureItem::ParagraphItem"
  end
end

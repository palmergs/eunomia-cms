require 'test_helper'

class StructureItem::TextItemTest < ActiveSupport::TestCase
  test "creation" do
    assert si = StructureItem::TextItem.create({ name: "Default Text", description: "A standard book paragraph" })
    assert si.ident == "default-text"
    assert si.type == "StructureItem::TextItem"
  end
end

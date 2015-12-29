class InlineRef < ApplicationRecord

  belongs_to :inline_ref

  belongs_to :content_item

  belongs_to :reference_item, class_name: 'ContentItem', foreign_key: :reference_item_id, primary_key: :id

end

class DataInstance < ActiveRecord::Base
  serialize :params, Hash
  serialize :values, Hash
  belongs_to :data_template

  validates :ident, presence: true
end

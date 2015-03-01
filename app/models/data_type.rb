class DataType < ActiveRecord::Base
  serialize :default_value, Hash
  serialize :default_params, Hash

  validates :name, presence: true
  validates :ident, presence: true, uniqueness: true


end

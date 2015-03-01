require 'normalizer'

class DataType < ActiveRecord::Base
  serialize :default_value, Hash
  serialize :default_params, Hash

  validates :name, presence: true
  validates :ident, presence: true, uniqueness: true

  before_validation do
    self.ident = Normalizer.normalize(self.name)
  end
end

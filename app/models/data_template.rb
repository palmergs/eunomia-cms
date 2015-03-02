require 'normalizer'

class DataTemplate < ActiveRecord::Base
  validates :name, presence: true
  validates :ident, presence: true, uniqueness: true
  before_validation do
    self.ident = Normalizer.normalize(self.name)
  end
end

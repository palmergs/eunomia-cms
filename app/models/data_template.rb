require 'normalizer'

class DataTemplate < ActiveRecord::Base

  has_many :data_instances

  validates :name, presence: true
  validates :ident, presence: true, uniqueness: true

  before_validation do
    self.ident = Normalizer.normalize(self.name)
    self.template = Nokogiri::HTML.fragment(self.template).to_s
  end

  def elements
    Nokogiri::HTML.fragment(self.template).children
  end

  def render_content

  end

  def render_editor

  end
end

class Normalizer
  include Singleton
  
  def normalize str
    str.downcase.strip.gsub(/[-][-]+/, '-').
        gsub(/[.][.]+/, '.').
        gsub(/[^a-z0-9._]+/, '-')
  end

  def self.normalize str
    self.instance.normalize(str)
  end
end

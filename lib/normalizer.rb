class Normalizer
  include Singleton

  def normalize str
    return nil if str.nil? || str.strip.empty?

    str.strip.downcase.gsub(/[-][-]+/, '-').
        gsub(/[.][.]+/, '.').
        gsub(/[^a-z0-9._]+/, '-')
  end

  def self.normalize str
    self.instance.normalize(str)
  end
end

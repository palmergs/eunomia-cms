class SlugSupport
  def slugify str
    SlugSupport.slugify(str)
  end

  def self.slugify str
    slug = str.to_s.downcase.strip
    tmp = slug.gsub(/[[:punct:]\s`$<>^|+=~]+/, '-').gsub(/^[-]+/, '')
    tmp.empty? ? nil : tmp
  end

  def self.namify slug
    tmp = slug.to_s.gsub(/[-]/, ' ');
    tmp.empty? ? nil : tmp
  end
end

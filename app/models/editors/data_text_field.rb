class Editors::DataTextField

  def editor data_instance
    builder = Nokogiri::HTML::Builder.new do |doc|
      doc.div(id_: data_instance.guid, class: data_instance.path_as_class) {
        doc.input(data_instance.editor_attributes.merge(
            type: 'text',
            name: data_instance.path_as_name),
            value: data_instance.value(:text))
      }
    end
  end

  def value data_instance
    builder = Nokogiri::HTML::Builder.new do |doc|
      doc.div(id_: data_instance.guid,
          class: data_instance.path_as_class,
          name: data_instance.path_as_name) {
        doc.text data_instance.value(:text)
      }
    end
  end
end
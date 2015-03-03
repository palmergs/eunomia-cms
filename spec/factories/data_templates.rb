FactoryGirl.define do
  factory :data_template do
    sequence(:name) {|n| "DataTemplate#{ n }" }
    description "A Template"
    template "<div><text-editor ident=\"text\"/></div>"
  end
end

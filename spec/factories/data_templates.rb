FactoryGirl.define do
  factory :data_template do
    sequence(:name) {|n| "DataTemplate#{ n }" }
    description "A Template"
    template "<div><data type=\"title\" ident=\"text\" uniq=\"true\"/></div>"
  end
end

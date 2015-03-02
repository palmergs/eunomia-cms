FactoryGirl.define do
  factory :data_template do
    sequence(:name) {|n| "DataTemplate#{ n }" }
    description "A Template"
    template ""
  end
end

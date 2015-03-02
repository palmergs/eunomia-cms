FactoryGirl.define do
  factory :data_type do
    sequence(:name) {|n| "Subtitle#{ n }" }
    editor "Editors::DataTextField"
    default_value({
        text: ''})
    default_params({
        maxlength: 128,
        minlength: 0,
        placeholder: 'Enter subtitle value'})
  end
end

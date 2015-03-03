FactoryGirl.define do
  factory :data_instance do
    data_template
    sequence(:ident) {|n| "data-instance-#{ n }" }
    values({ text: 'This is a test' })
    params({ minlength: 0 })
  end
end

FactoryGirl.define do
  factory :account_wo_title, class: Account do
    title nil
    description "Lorem ipsum sit magna occaecat consequat ut aliqua."
  end

  factory :account_with_valid_attr, class: Account do
    title "Lorem ipsum"
    description "Lorem ipsum sit magna occaecat consequat ut aliqua."
  end
end
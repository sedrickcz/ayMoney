FactoryGirl.define do
  factory :category_wo_title, class: Category do
    title nil
    description "Lorem ipsum sit magna occaecat consequat ut aliqua."
  end

  factory :category_with_valid_attr, class: Category do
    title "Lorem ipsum"
    description "Lorem ipsum sit magna occaecat consequat ut aliqua."
  end
end
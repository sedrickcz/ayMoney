# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :setting_wo_name, class: Setting do
    name nil
    value "35"
  end
end

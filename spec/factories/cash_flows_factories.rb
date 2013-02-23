FactoryGirl.define do
  factory :cash_flow_wo_date, class: CashFlow do
    date nil
    amount 356.5
    category_id 1
    account_id 1
    description "Lorem ipsum sit magna occaecat consequat ut aliqua."
    deleted false
  end

  factory :cash_flow_wo_amount, class: CashFlow do
    date Date.current
    amount nil
    category_id 1
    account_id 1
    description "Lorem ipsum sit magna occaecat consequat ut aliqua."
    deleted false
  end

  factory :cash_flow_wo_category_id, class: CashFlow do
    date Date.current
    amount 365
    category_id nil
    account_id 1
    description "Lorem ipsum sit magna occaecat consequat ut aliqua."
    deleted false
  end

  factory :cash_flow_wo_account_id, class: CashFlow do
    date Date.current
    amount 365
    category_id 1
    account_id nil
    description "Lorem ipsum sit magna occaecat consequat ut aliqua."
    deleted false
  end

  factory :cash_flow_with_not_valid_amount, class: CashFlow do
    date Date.current
    amount 'ahoj'
    category_id 1
    account_id 1
    description "Lorem ipsum sit magna occaecat consequat ut aliqua."
    deleted false
  end

  factory :cash_flow_with_valid_attr, class: CashFlow do
    date Date.current
    amount -365
    category_id 1
    account_id 1
    description "Lorem ipsum sit magna occaecat consequat ut aliqua."
    deleted false
  end
end
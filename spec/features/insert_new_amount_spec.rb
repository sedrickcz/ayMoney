require 'spec_helper'

describe "insert new amount", type: :feature do
before :each do
    Category.create([title: 'Home'])
    Account.create([title: 'mBank'])
  end
  it "add new amount to table with correct values" do
    visit root_path
    select '2013', from: 'cash_flow_date_1i'
    select 'February', from: 'cash_flow_date_2i'
    select '22', from: 'cash_flow_date_3i'
    fill_in 'Amount', with: '300'
    select 'mBank', from: 'Account'
    select 'Home', from: 'Category'
    fill_in 'Description', with: 'Electricity overpayment'
    click_button 'Add Amount'
    # visit root_path
    page.should have_content '$300.00'
  end

  it "add new amount to table without amount" do
    visit root_path
    select '2013', from: 'cash_flow_date_1i'
    select 'February', from: 'cash_flow_date_2i'
    select '22', from: 'cash_flow_date_3i'
    select 'mBank', from: 'Account'
    select 'Home', from: 'Category'
    fill_in 'Description', with: 'Electricity overpayment'
    click_button 'Add Amount'
    page.should have_content "can't be blank"
  end

  it "add new amount to table without Account" do
    visit root_path
    select '2013', from: 'cash_flow_date_1i'
    select 'February', from: 'cash_flow_date_2i'
    select '22', from: 'cash_flow_date_3i'
    fill_in 'Amount', with: '300'
    select 'Home', from: 'Category'
    fill_in 'Description', with: 'Electricity overpayment'
    click_button 'Add Amount'
    page.should have_content "can't be blank"
  end

  it "add new amount to table without Category" do
    visit root_path
    select '2013', from: 'cash_flow_date_1i'
    select 'February', from: 'cash_flow_date_2i'
    select '22', from: 'cash_flow_date_3i'
    fill_in 'Amount', with: '300'
    select 'mBank', from: 'Account'
    fill_in 'Description', with: 'Electricity overpayment'
    click_button 'Add Amount'
    page.should have_content "can't be blank"
  end

  it "add new amount to table with not a number" do
    visit root_path
    select '2013', from: 'cash_flow_date_1i'
    select 'February', from: 'cash_flow_date_2i'
    select '22', from: 'cash_flow_date_3i'
    fill_in 'Amount', with: 'ahoj'
    select 'mBank', from: 'Account'
    select 'Home', from: 'Category'
    fill_in 'Description', with: 'Electricity overpayment'
    click_button 'Add Amount'
    page.should have_content "is not a number"
  end
end
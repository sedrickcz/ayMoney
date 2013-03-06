require 'spec_helper'

describe CashFlow do
  it "should not be valid without date" do 
    cf = FactoryGirl.build(:cash_flow_wo_date)
    cf.should_not be_valid
  end

  it "should not be valid without amount" do 
    cf = FactoryGirl.build(:cash_flow_wo_amount)
    cf.should_not be_valid
  end

  it "should not be valid without category" do 
    cf = FactoryGirl.build(:cash_flow_wo_category_id)
    cf.should_not be_valid
  end

  it "should not be valid without account id" do 
    cf = FactoryGirl.build(:cash_flow_wo_account_id)
    cf.should_not be_valid
  end

  it "should be valid with valid attributes" do 
    cf = FactoryGirl.build(:cash_flow_with_valid_attr)
    cf.should be_valid
  end

  it "should not be valid if ammount is not number" do 
    cf = FactoryGirl.build(:cash_flow_with_not_valid_amount)
    cf.should_not be_valid
  end

  it "actual balance should return number" do 
    FactoryGirl.create(:cash_flow_valid)
    FactoryGirl.create(:cash_flow_valid)
    
    CashFlow.actual_balance.should eq(1000)
  end



end

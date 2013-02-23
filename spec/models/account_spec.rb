require 'spec_helper'

describe Account do
  it "should not be valid without title" do 
    account = FactoryGirl.build(:account_wo_title)
    account.should_not be_valid
  end

  it "should not be valid if account already exists" do 
    account_1 = FactoryGirl.create(:account_with_valid_attr)
    account_2 = FactoryGirl.build(:account_with_valid_attr)
    account_2.should_not be_valid
  end

  it "should be valid with valid attributes" do 
    account = FactoryGirl.build(:account_with_valid_attr)
    account.should be_valid
  end
end

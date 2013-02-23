require 'spec_helper'

describe Category do
  it "should not be valid without title" do 
    category = FactoryGirl.build(:category_wo_title)
    category.should_not be_valid
  end

  it "should not be valid if category already exists" do 
    category_1 = FactoryGirl.create(:category_with_valid_attr)
    category_2 = FactoryGirl.build(:category_with_valid_attr)
    category_2.should_not be_valid
  end

  it "should be valid with valid attributes" do 
    category = FactoryGirl.build(:category_with_valid_attr)
    category.should be_valid
  end
end

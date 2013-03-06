require 'spec_helper'

describe Setting do
  before :each do
    Setting.create(name: 'name', value: "Jirka", input_type: 'text')
    Setting.create(name: "currency", input_type: 'select', input_options: "czk|eur|gbp|usd")
  end
  it "should not be valid without name" do
    setting = FactoryGirl.build(:setting_wo_name)
    setting.should_not be_valid
  end

  it "update_all should be true if valid params" do
    settings = {"name_value"=>"Jirka", "currency_value"=>"czk"}
    ok = Setting.update_all(settings)
    Setting.update_all(settings).should be_true
  end

  it "update_all should be false if invalid params" do
    settings = {"name_value"=>"", "currency_value"=>""}
    Setting.update_all(settings).should be_false
  end

  it "username should be Jirka" do
    Setting.username.should eq('Jirka')
  end

  it "username should be Mr. Nobody if nil" do
    setting = Setting.find_by_name('name')
    setting.value = nil
    setting.save!
    Setting.username.should eq('Mr. Nobody')
  end

  it "username should be Mr. Nobody if blank" do
    setting = Setting.find_by_name('name')
    setting.value = ""
    setting.save!
    Setting.username.should eq('Mr. Nobody')
  end

  it "currency_value should be czk" do
    setting = Setting.find_by_name('currency')
    setting.value = "czk"
    setting.save!
  
    Setting.currency_value.should eq('czk')
  end

  it "currency_value should be usd if value is nil" do
    setting = Setting.find_by_name('currency')
    setting.value = nil
    setting.save!
  
    Setting.currency_value.should eq('usd')
  end

  it "currency_value should be usd if value is blank" do
    setting = Setting.find_by_name('currency')
    setting.value = ""
    setting.save!
  
    Setting.currency_value.should eq('usd')
  end

end

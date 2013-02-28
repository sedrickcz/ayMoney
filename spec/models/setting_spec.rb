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

end

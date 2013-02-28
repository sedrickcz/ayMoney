require 'spec_helper'

describe SettingsHelper do
  describe "username" do 
    it "should return name" do
      Setting.create(name: 'name', value: "Jirka", input_type: 'text')
      Setting.create(name: "currency", input_type: 'select', input_options: "czk|eur|gbp|usd")
      @settings = Setting.all
      username.should == 'Jirka'
    end

    it "should return Mr. Nobody if value is nil" do
      Setting.create(name: 'name', value: nil, input_type: 'text')
      Setting.create(name: "currency", input_type: 'select', input_options: "czk|eur|gbp|usd")
      @settings = Setting.all
      username.should == 'Mr. Nobody'
    end

    it "should return Mr. Nobody if value is blank" do
      Setting.create(name: 'name', value: "", input_type: 'text')
      Setting.create(name: "currency", input_type: 'select', input_options: "czk|eur|gbp|usd")
      @settings = Setting.all
      username.should == 'Mr. Nobody'
    end
  end
end
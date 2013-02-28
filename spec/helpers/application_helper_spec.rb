require 'spec_helper'

describe ApplicationHelper do
  describe "generate_field_tag" do 
    it "should return text tag type" do
      settings = Setting.create(name: 'name', value: nil, input_type: 'text')
      generate_field_tag(settings).should == '<input id="name_value" name="settings[name_value]" type="text" />'
    end

    it "should return select tag type" do
      settings = Setting.create(name: "currency", input_type: 'select', input_options: "czk|eur|gbp|usd")
      generate_field_tag(settings).should == '<select id="currency_value" name="settings[currency_value]"><option value="czk">czk</option>
<option value="eur">eur</option>
<option value="gbp">gbp</option>
<option value="usd">usd</option></select>'
    end

    it "should return empty string if type is nil" do
      settings = Setting.create(name: 'name', value: nil, input_type: nil)
      generate_field_tag(settings).should == ''
    end
  end
end
require 'spec_helper'

describe "edit settings", type: :feature do
    before :each do
        Setting.create(name: 'name')
        Setting.create(name: "currency", input_type: 'select', input_options: "czk|eur|gbp|usd")
    end
    it "edit name value" do
        visit settings_path
        fill_in 'name_value', with: 'Jirka'
        select 'czk', from: 'currency_value'

        click_button 'Update Settings'
        # visit root_path
        page.should have_content 'Settings updated successfully'
    end

    it "edit with name has no values should edit currency" do
        visit settings_path
        fill_in 'name_value', with: ''
        select 'eur', from: 'currency_value'
        click_button 'Update Settings'
        # visit root_path
        page.should have_content 'Settings updated successfully'
    end

end
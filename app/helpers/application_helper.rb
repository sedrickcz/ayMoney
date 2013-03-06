module ApplicationHelper
  include ActionView::Helpers::NumberHelper

  def generate_field_tag settings
    case settings.input_type
    when "text"
      return text_field_tag "settings[#{settings.name}_value]", settings.value, id: "#{settings.name}_value"
    when "select"
      return select_tag "settings[#{settings.name}_value]", options_for_select(settings.options, settings.value), id: "#{settings.name}_value"
    else
      return ""
    end
  end

  def get_actual_balance
    balance = CashFlow.actual_balance
    get_amount_in_format balance
  end

  def get_amount_in_format amount
    case Setting.currency_value
    when "czk"
      number_to_currency(amount, precision: 2, locale: :cs)
    when "gbp"
      number_to_currency(amount, precision: 2, locale: 'en-GB')
    when "eur"
      number_to_currency(amount, precision: 2, locale: :de)
    else
      number_to_currency(amount, precision: 2)
    end
  end
end

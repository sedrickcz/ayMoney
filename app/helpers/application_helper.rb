module ApplicationHelper
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
end

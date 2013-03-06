class Setting < ActiveRecord::Base
  attr_accessible :name, :value, :input_type, :input_options

  validates :name, presence: true

  def options
    input_options.split('|') if input_options
  end

  class << self
    def update_all params
      ok = false
      if params and params.any?
        params.each do |key, value|
          unless value.blank?
            setting = Setting.find_by_name(key.split('_').first)
            ok = setting.update_attributes(value: value) if setting
          end
        end
      end
      ok
    end

    def username
      name = self.get_name
      name = 'Mr. Nobody' if name.blank?
      name
    end

    def currency_value
      currency = self.get_currency
      currency = 'usd' if currency.blank?
      currency
    end

    protected

    def get_name
      select { |s| s.name == 'name'}.first.try(:value)
    end

    def get_currency
      select { |s| s.name == 'currency'}.first.try(:value)
    end

  end

end

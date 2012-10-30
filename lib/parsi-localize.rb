require 'parsi-digits'
require 'parsi-date'
require 'i18n'

module I18n
  class << self
    def localize object, options={}
      return '' if object.nil?

      locale = options.delete(:locale) || config.locale
      format = options.delete(:format) || :default

      if [:default, :short, :long].include? format
        format = I18n.t("date.formats.#{format}") if object.is_a? Date
        format = I18n.t("time.formats.#{format}") if object.is_a? Time
      end

      if locale == :fa
        if object.respond_to?(:with_parsi_digits)
          object.with_parsi_digits
        elsif [Date, DateTime, Time, Parsi::Date, Parsi::DateTime].include? object.class
          object.to_jalali.strftime(format).with_parsi_digits
        else
          config.backend.localize locale, object, format, options
        end
      else
        config.backend.localize locale, object, format, options
      end
    end
    alias :l :localize
  end
end

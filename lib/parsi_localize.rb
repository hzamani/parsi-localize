require 'parsi_digits'
require 'jalalidate'
require 'i18n'

module I18n
  class << self
    def localize(object, options={})
      return '' if object.nil?

      locale = options.delete(:locale) || config.locale
      format = options.delete(:format) || :default

      if locale == :fa and not object.nil?
        if object.respond_to? :with_parsi_digits
          object.with_parsi_digits
        elsif object.is_a? Date or object.is_a? Time
          jdate = JalaliDate.new object
          if [:default, :short, :long].include? format
            format = I18n.t("date.formats.#{format}") if object.is_a? Date
            format = I18n.t("time.formats.#{format}") if object.is_a? Time
          end
          jdate.strftime(format).with_parsi_digits
        end
      else
        config.backend.localize(locale, object, format, options)
      end
    end
    alias :l :localize
  end
end

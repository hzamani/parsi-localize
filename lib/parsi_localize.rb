require 'parsi_digits'
require 'jalalidate'
require 'i18n'

module I18n
  class << self
    def localize(object, options = {})
      locale = options.delete(:locale) || config.locale
      format = options.delete(:format) || :default

      if locale == :fa and not object.nil?
        if object.respond_to? :with_parsi_digits
          object.with_parsi_digits
        elsif object.is_a? Date or object.is_a? Time
          jdate = JalaliDate.new object
          format = I18n.t("time.formats.default") if format == :default
          jdate.strftime(format).with_parsi_digits
        end
      else
        config.backend.localize(locale, object, format, options)
      end
    end
    alias :l :localize
  end
end

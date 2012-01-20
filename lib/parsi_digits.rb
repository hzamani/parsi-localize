# encoding: utf-8

module Parsi
  module Digits
    PARSI_DIGITS = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹']
    
    class << self
      def to_parsi digit
        PARSI_DIGITS[digit.to_i] if digit =~ /[0-9]/
      end
      
      def to_western digit
        PARSI_DIGITS.index digit if digit =~ /[۰-۹]/
      end
    end
  end
end

class String
  def with_parsi_digits
    gsub(/\d/) { |d| Parsi::Digits.to_parsi d }
  end
  
  def with_parsi_digits!
    gsub!(/\d/) { |d| Parsi::Digits.to_parsi d }
  end
  
  def with_western_digits
    gsub(/[۰-۹]/) { |d| Parsi::Digits.to_western d }
  end
  
  def with_western_digits!
    gsub!(/[۰-۹]/) { |d| Parsi::Digits.to_western d }
  end
  
  def has_parsi_digits?
    self =~ /[۰-۹]/
  end
  
  alias_method :western_to_i, :to_i
  def to_i base=10
    if has_parsi_digits?
      with_western_digits.western_to_i base
    else
      western_to_i base
    end
  end
  
  alias_method :western_to_f, :to_f
  def to_f
    if has_parsi_digits?
      with_western_digits.sub("/",".").western_to_f
    else
      western_to_f
    end
  end
end

class Integer
  def with_parsi_digits
    to_s.with_parsi_digits
  end
end

class Float
  def with_parsi_digits
    to_s.with_parsi_digits.sub '.', '/'
  end
end

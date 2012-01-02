# encoding: utf-8

class String
  def with_parsi_digits
    digits = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹']
    gsub(/\d/) { |d| digits[d.to_i] }
  end
  
  def with_parsi_digits!
    digits = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹']
    gsub!(/\d/) { |d| digits[d.to_i] }
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

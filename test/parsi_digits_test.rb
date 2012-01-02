# encoding: utf-8

require 'test_helper'

class ParsiDigitsTest < Test::Unit::TestCase
  def test_string_with_parsi_digits
    assert_equal "۹۸۷۶۵۴۳۲۱۰", "9876543210".with_parsi_digits
  end
  
  def test_integer_with_parsi_digits
    assert_equal "۹۸۷۶۵۴۳۲۱۰", 9876543210.with_parsi_digits
  end
  
  def test_float_with_parsi_digits
    assert_equal "۹/۰۸۷۶۵۴۳۲۱", 9.087654321.with_parsi_digits
  end
  
  def test_localize
    assert_equal "۹۸۷۶۵۴۳۲۱۰",  I18n.l("9876543210")
    assert_equal "۹۸۷۶۵۴۳۲۱۰",  I18n.l(9876543210)
    assert_equal "۹/۰۸۷۶۵۴۳۲۱", I18n.l(9.087654321)
    time = Time.mktime(2012, 1, 3, 5, 43, 32)
    date = Time.mktime(2012, 1, 3)
    assert_equal "۹۰/۱۰/۱۳ ۰۵:۴۳:۳۲", I18n.l(time)
    assert_equal "۹۰/۱۰/۱۳ ۰۰:۰۰:۰۰", I18n.l(date)
    assert_equal "۱۳ دی ۹۰", I18n.l(time, format: "%d %b %y")
  end
end

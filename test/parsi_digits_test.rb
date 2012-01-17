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
  
  def test_localize_numbers
    assert_equal "۹۸۷۶۵۴۳۲۱۰",  I18n.l("9876543210")
    assert_equal "۹۸۷۶۵۴۳۲۱۰",  I18n.l(9876543210)
    assert_equal "۹/۰۸۷۶۵۴۳۲۱", I18n.l(9.087654321)
  end

  def test_localize_date_format
    date = Date.new(2012, 2, 5)
    assert_equal "۹۰/۱۱/۱۶", I18n.l(date)
    assert_equal "۹۰/۱۱/۱۶", I18n.l(date, format: :default)
    assert_equal "۱۶ بهمن", I18n.l(date, format: :short)
    assert_equal "یک‌شنبه، ۱۶ بهمن ۱۳۹۰", I18n.l(date, format: :long)
  end

  def test_localize_time_format
    time = Time.new(2012, 2, 5, 15, 43, 30)
    assert_equal "۹۰/۱۱/۱۶ ۱۵:۴۳:۳۰", I18n.l(time)
    assert_equal "۹۰/۱۱/۱۶ ۱۵:۴۳:۳۰", I18n.l(time, format: :default)
    assert_equal "۱۶ بهمن، ۱۵:۴۳", I18n.l(time, format: :short)
    assert_equal "یک‌شنبه، ۱۶ بهمن ۱۳۹۰، ساعت ۱۵:۴۳:۳۰ (IRST)", I18n.l(time, format: :long)
  end
end

# encoding: utf-8

require 'test_helper'

class ParsiLocalizeTest < Test::Unit::TestCase
  def test_localize_numbers
    assert_equal "۹۸۷۶۵۴۳۲۱۰",  I18n.l("9876543210")
    assert_equal "۹۸۷۶۵۴۳۲۱۰",  I18n.l(9876543210)
    assert_equal "۹/۰۸۷۶۵۴۳۲۱", I18n.l(9.087654321)
  end

  def test_localize_format
    time = Time.new(2012, 2, 5, 15, 43, 30)
    assert_equal "۹۰/۱۱/۱۶", I18n.l(time, format: "%y/%m/%d")
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

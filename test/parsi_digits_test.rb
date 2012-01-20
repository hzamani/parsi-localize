# encoding: utf-8

require 'test_helper'

class ParsiDigitsTest < Test::Unit::TestCase
  def test_string_with_parsi_digits
    assert_equal "۹۸۷۶۵۴۳۲۱۰", "9876543210".with_parsi_digits
  end
  
  def test_string_with_western_digits
    assert_equal "9876543210", "۹۸۷۶۵۴۳۲۱۰".with_western_digits
  end
  
  def test_parsi_string_to_i
    assert_equal 9876543210, "۹۸۷۶۵۴۳۲۱۰".to_i
    assert_equal 9876543210, "9876543210".to_i
  end
  
  def test_parsi_string_to_f
    assert_equal 0.987654321, "۰/۹۸۷۶۵۴۳۲۱".to_f
    assert_equal 0.987654321, "0.987654321".to_f
  end
  
  def test_integer_with_parsi_digits
    assert_equal "۹۸۷۶۵۴۳۲۱۰", 9876543210.with_parsi_digits
  end
  
  def test_float_with_parsi_digits
    assert_equal "۹/۰۸۷۶۵۴۳۲۱", 9.087654321.with_parsi_digits
  end
  
  def test_has_parsi_digits
    assert "۱۹۴".has_parsi_digits?
    assert "test۹۸".has_parsi_digits?
    assert !"123".has_parsi_digits?
    assert !"test".has_parsi_digits?
  end
end

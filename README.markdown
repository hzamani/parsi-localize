ParsiLocalize
=============

Enhance I18n localize to use Parsi digits and Jalaly dates in Farsi (فارسی) locale.

For changing digits in string/integer/float with Unicode Parsi ones, we use
[`parsi-digits`](https://github.com/hzamani/parsi-digits):

    require 'parsi-localize'
    I18n.l ‪‪"15,000 تومان"
      => ‫‫"۱۵,۰۰۰ تومان"

Another useful feature of `parsi-digits` is that you can parse strings with Unicode
digits to numerics:

    "۱۲۳۴۵".to_i
      => 12345
    "۱۹/۸".to_f
      => 19.8

To have a real localization of dates in I18n#localize (converting them to Jalali date),
we uses [`parsi-date`](https://github.com/hzamani/parsi-date):

    I18n.l Time.now, fromat: "%y/%m/%d %H:%M:%S"
      => "۹۰/۱۰/۱۳ ۰۵:۴۳:۳۲"

As you know, date and time formats can be stored in the locale file.
For example with

    fa:
      time:
        formats:
          default: "%y/%m/%d %H:%M:%S"
          short: "%d %B، %H:%M"
          long: "%A، %e %B %Y، ساعت %H:%M:%S"
      date:
        formats:
          default: "%y/%m/%d"
          short: "%d %B"
          long: "%A، %e %B %Y"

in your locale file, you will get:

    date = Date.today
    I18n.l date
      => ‫"۹۰/۱۱/۱۶"
    I18n.l date, format: :short
      => ‫"۱۶ بهمن"
    I18n.l date, format: :long
      => ‫"یک‌شنبه، ۱۶ بهمن ۱۳۹۰"

    time = Time.now
    I18n.l time
      => "۹۰/۱۱/۱۶ ۱۵:۴۳:۳۰"
    I18n.l time, format: :short
      => ‫"۱۶ بهمن، ۱۵:۴۳"
    I18n.l time, format: :long
      => ‫"یک‌شنبه، ۱۶ بهمن ۱۳۹۰، ساعت ۱۵:۴۳:۳۰"

For more info on date formating see `parsi-date` and Ruby's built-in `date` docs.

Copyright (c) 2012 Hassan Zamani, released under the MIT license.

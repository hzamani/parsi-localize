ParsiLocalize
=============

Change I18n localize to use parsi digits and jalaly dates in farsi (فارسی) locale.
This gem contains two sections

ParsiDigits
-----------
Simply change digits in a string/integer/float to unicode parsi digits:

    require 'parsi_digits'
    ‪"15,000 تومان".with_parsi_digits
      => ‫"۱۵,۰۰۰ تومان"
    123.25.with_parsi_digits
      => "۱۲۳/۲۵"

It also dose the reverse action:

    "۱۲۳۴۵".with_western_digits
      => "12345"

And it undersanad parsi digits (which is useful especially for input forms):

    "۱۲۳۴۵".to_i
      => 12345
    "۱۹/۸".to_f
      => 19.8

ParsiLocalize
-------------
Change behaivor of I18n#localize so that it localize digits and dates in 'farsi' locale.

    require 'parsi_localize'
    I18n.l ‪‪"15,000 تومان" 
      => ‫‫"۱۵,۰۰۰ تومان"
    I18n.l Time.now, fromat: "%y/%m/%d %H:%M:%S"
      => "۹۰/۱۰/۱۳ ۰۵:۴۳:۳۲"

If you don't set date format, it uses the default locale format, wich you can set in your locale file.
For example with

    fa:
      time:
        formats:
          default: "%y/%m/%d %H:%M:%S"
          short: "%d %b، %H:%M"
          long: "%A، %e %b %Y، ساعت %H:%M:%S (%Z)"
      date:
        formats:
          default: "%y/%m/%d"
          short: "%d %b"
          long: "%A، %e %b %Y"
          
in your locale file you will get:

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
      => ‫"یک‌شنبه، ۱۶ بهمن ۱۳۹۰، ساعت ۱۵:۴۳:۳۰ (IRST)"

For more info on dateformating see 'jalalidate' docs

Copyright (c) 2012 Hassan Zamani, released under the MIT license.

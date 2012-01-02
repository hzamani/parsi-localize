ParsiLocalize
=============

Change I18n localize to use parsi digits and jalaly dates in farsi (فارسی) locale.
This gem contains two sections

ParsiDigits
-----------
Simply change digits in a string/integer/float to unicode parsi digits.

(In all the example below we have right to left issues to present output!)

Example:

    require 'parsi_digits'
    ‪"15,000 تومان".with_parsi_digits => "۱۵,۰۰۰ تومان"
    123.25.with_parsi_digits => "۱۲۳/۲۵"


ParsiLocalize
-------------
Change behaivor of I18n#localize so that it localize digits and dates in 'farsi' locale.

    require 'parsi_localize'
    I18n.l ‪"15,000 تومان" => "۱۵,۰۰۰ تومان"
    I18n.l Time.now, fromat: "%y/%m/%d %H:%M:%S" => "۹۰/۱۰/۱۳ ۰۵:۴۳:۳۲"

If you don't set date format, it uses the default locale format (time.formats.default) wich you can set in your locale file. For more info on dateformating see 'jalalidate' docs
For example with

    fa:
      time:
        formats:
          default: "%d %b %y"
          
in your locale file you will get:

    I18n.l Time.now => "۱۳ دی ۹۰"

Copyright (c) 2012 Hassan Zamani, released under the MIT license.

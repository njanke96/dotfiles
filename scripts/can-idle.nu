#!/usr/bin/nu

# temporarily used by safe-suspend.sh
let can_idle = elogind-inhibit
  | detect columns --guess
  | where MODE == 'block'
  | get WHAT
  | any {|mode| ($mode | str contains idle) or ($mode | str contains sleep)}

exit ($can_idle | into int)

#!/bin/bash
while [ "$select" != "NO" -a "$select" != "YES" ]; do
    select=$(echo -e 'NO\nYES' | dmenu -nb '#7ED78D' -nf '#AA3333' -sb '#7ED78D' -sf '#111111' -fn '-*-*-medium-r-normal-*-*-*-*-*-*-100-*-*' -i -p "Do you want to quit this Xsession?                                                                                                                                       ")
    [ -z "$select" ] && exit 0
done
[ "$select" = "NO" ] && exit 0
i3-msg exit

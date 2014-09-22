
# copy and patse to Sonic Pi IDE

current_sound = 0.3
set_volume! current_sound

in_thread do 
  sleep 1
  loop do
    sleep 0.05
    current_sound += 0.01
    set_volume! current_sound
    break if current_sound >= 1
  end
end

in_thread do
  loop do
    cue :tick
    sleep 0.4
  end
end


in_thread do
  loop do
    # sleep 0.4
    sync :tick
    play 50, pan: rrand(0, 2) - 1, amp: rrand(0.1, 0.15)
    play 54, pan: rrand(0, 2) - 1, amp: rrand(0.1, 0.15)
    play 58, pan: rrand(0, 2) - 1, amp: rrand(0.1, 0.15)
  end
end

in_thread do
  sleep 1.6
  with_bpm 20 do
    loop do
      sleep 0.2
      # sync :tick
      play 60, pan: rrand(0, 2) - 1, amp: rrand(0, 0.1)
      play 62, pan: rrand(0, 2) - 1, amp: rrand(0, 0.1)
      play 64, pan: rrand(0, 2) - 1, amp: rrand(0, 0.1)
    end
  end
end

in_thread do
  loop do 
    sample :ambi_choir, rate: 0.2, pan: rrand(0, 2) - 1, amp: 0.33
    sleep 0.5
  end
end
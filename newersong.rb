use_bpm 130

def play_note(note_value, duration)
  release_duration = duration
  if duration < 1
    release_duration = 1
  end
  
  play note_value, release: release_duration, amp: 0.90
  sleep duration
end

define :rapnoise do
  10.times do
    sample :drum_cymbal_pedal, start: 0.1, finish: 0.3, rate: 2, amp: 5 + rrand(-0.1, 0.1)
    sleep 0.0892
  end
end



def arp_d_2
  play_pattern [:d4, :fs4, :b4, :cs5, :fs5, :fs4, :b4, :cs5], [0.5], amp: 0.4
  play_pattern [:e5, :fs4, :b4, :cs5, :fs5, :fs4, :b4, :cs5], [0.5], amp: 0.4
end

def arp_fs_2
  play_pattern_timed [:cs4, :e4, :b4, :cs5, :fs5, :fs4, :b4, :cs5], [0.5], amp: 0.4
  play_pattern_timed [:e5, :fs4, :b4, :cs5, :fs5, :fs4, :b4, :cs5], [0.5], amp: 0.4
end

# bass parts

def bass_d
  play :d2, release: 1.5
  sleep 1.5
  play :d2, release: 1.5
  sleep 1.5
  play :a2
  sleep 0.5
  play :d3
  sleep 0.5
end

def bass_fs_2
  play :fs2, release: 1.5
  sleep 1.5
  play :fs2, release: 1.5
  sleep 1.5
  play :cs3
  sleep 0.5
  play :fs3
  sleep 0.5
  
  play :fs2, release: 1.5
  sleep 1.5
  play :fs2, release: 1.5
  sleep 1.5
  play :e2
  sleep 1
end

def bass_cs_2
  play :cs2, release: 1.5
  sleep 1.5
  play :cs2, release: 1.5
  sleep 1.5
  play :gs2
  sleep 0.5
  play :cs3
  sleep 0.5
  
  play :cs2, release: 1.5
  sleep 1.5
  play :cs2, release: 1.5
  sleep 1.5
  play :gs2
  sleep 1
end

def bass_e
  play :e2, release: 1.5
  sleep 1.5
  play :e2, release: 1.5
  sleep 1.5
  play :b2
  sleep 0.5
  play :e3
  sleep 0.5
end

#start of song

use_synth :fm
nbc_notes = [:e3, :e4, :e3, :e4, :ef3, :ef4, :ef3, :ef4,] # an array is a list of values

live_loop :ds do
  x = 0
  8.times do
    play nbc_notes[x]
    sleep 4.8
    x = x + 1
    print x
  end
end

rapnoise

live_loop :arp do
  # intro
  arp_d_2
  arp_d_2
  
  # bass & drums go
  arp_d_2
  arp_fs_2
  
  
  loop do
    arp_d_2
    arp_fs_2
  end
end

live_loop :bass do
  sleep 16
  
  bass_d #defined being called
  bass_d
  bass_fs_2
  
  # start of melodic sound
  bass_d
  bass_d
  bass_cs_2
  
  bass_d
  bass_d
  bass_fs_2
  
  bass_d
  bass_d
  bass_cs_2
  
  bass_d
  bass_e
  bass_fs_2
end

live_loop :kick_drum do
  sleep 16
  loop do
    sample :drum_tom_lo_soft, rate: 0.5
    sleep 0.75
    sample :drum_tom_lo_soft
    sleep 0.75
    sample :drum_tom_lo_soft
    sleep 1
    sample :drum_tom_lo_soft
    sleep 1.5
  end
end

live_loop :snare_drum do
  sleep 16
  loop do
    sleep 1
    sample :drum_tom_hi_soft
    sleep 1
  end
end


stop


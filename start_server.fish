#!/usr/bin/fish

# python virtual environment must already be established
# python3 -m venv venv

source venv/bin/activate.fish

set -l MAX_RANDOM_DELAY 0

set -l i 1
set -l args_count (count $argv)
while test $i -le $args_count
    set -l arg $argv[$i]
    if test "$arg" = "--add-delay"
        set -l next_idx (math $i + 1)
        set MAX_RANDOM_DELAY $argv[$next_idx]
    end
    set i (math $i + 1)
end

set -x MAX_RANDOM_DELAY $MAX_RANDOM_DELAY

python3 server.py $argv

#!/usr/bin/bash

# python virtual environment must already be established
# python3 -m venv venv

source venv/bin/activate

MAX_RANDOM_DELAY=0

while [[ "$#" -gt 0 ]]; do
  case $1 in
    --max-delay)
      MAX_RANDOM_DELAY="$2"
      shift 2
      ;;
    *)
      shift
      ;;
  esac
done

echo "MAX RANDOM DELAY IS: ${MAX_RANDOM_DELAY}"
export MAX_RANDOM_DELAY

python3 server.py "$@"

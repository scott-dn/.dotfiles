#!/usr/bin/env bash
# Claude Code status line — inspired by Spaceship prompt

input=$(cat)

time_str=$(date +%H:%M:%S)
user=$(whoami)
host=$(hostname -s)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
[ -z "$cwd" ] && cwd=$(pwd)
dir=$(basename "$cwd")

model=$(echo "$input" | jq -r '.model.display_name // empty')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Build context info
ctx_info=""
if [ -n "$used" ]; then
  ctx_info=$(printf " | ctx: %.0f%% used" "$used")
fi

# Build model info
model_info=""
if [ -n "$model" ]; then
  model_info=" | $model"
fi

printf "\033[2m%s %s@%s ~/%s%s%s\033[0m" \
  "$time_str" "$user" "$host" "$dir" "$model_info" "$ctx_info"

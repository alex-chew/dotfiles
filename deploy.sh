#!/usr/bin/env bash

config="dotfiles.cfg"
here="$(pwd)"
postdeploy="postdeploy.sh"

[[ -r $config ]] || { echo "$config not found"; exit 1; }
while read -r line || [[ -n $line ]]; do
  # Get src and dst
  src=$(cut -d= -sf 1 <<< "$line")
  dst=$(cut -d= -sf 2 <<< "$line")
  abs_src="${here}/${src}"
  abs_dst="${HOME}/${dst}"
  [[ -z $src || -z $dst || -z $abs_src || -z $abs_dst ]] && continue

  # Continue if src doesn't exist
  if [[ ! -e $abs_src ]]; then
    echo "? | $src not found"
    continue
  fi

  # Continue if link is already correct
  if [[ $(readlink "$abs_dst") = "$abs_src" ]]; then
    echo "  | ~/$dst is already linked"
    continue
  fi

  # Ensure base dir exists
  dst_dir="$(dirname "$abs_dst")"
  if [[ ! -d $dst_dir ]]; then
    mkdir -p "$dst_dir" || { echo "X | failed to create $dst_dir"; continue; }
  fi

  # Backup dst
  if [[ -e $abs_dst ]]; then
    mv "$abs_dst" "${abs_dst}.old" || { echo "X | failed to backup ~/$dst"; continue; }
  fi

  # Create link with backup
  if ln -s "$abs_src" "$abs_dst"; then
    echo "+ | linked $src to ~/$dst"
  else
    echo "X | failed to link $src to ~/$dst"
  fi
done < "$config"

if [[ -e $postdeploy ]]; then
  . "$postdeploy" \
    && echo "$postdeploy ran successfully" \
    || echo "$postdeploy failed"
fi


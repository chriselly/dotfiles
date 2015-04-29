#!/usr/bin/env bash
export PGHOST=/tmp
export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
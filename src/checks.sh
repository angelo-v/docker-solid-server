#!/bin/sh

checks_failed=0

check_failed()
{
  checks_failed=$((checks_failed + 1))
}
check_dir_exists()
{
  dir=$1
  if [ -f "${dir}" ]; then
    echo "✓ ${dir} exists"
  else
    echo "✗ ${dir} missing"
    check_failed
  fi
}

check_dir_exists "${SOLID_HOME}/data"
check_dir_exists "${SOLID_HOME}/.db"
check_dir_exists "${SOLID_HOME}/config"

if [ "$checks_failed" -gt 0 ]; then
  echo "Finished: ERROR"
  exit 1
fi

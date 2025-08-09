#!/bin/bash

trg="${1:-/usr/local/bin/depin}"
src="$(dirname "$0")/depin"

echo -e "Installing depin to $trg..."
echo -e "\nCopying $src to $trg..."
if sudo cp $src $trg; then
  echo -e "\nDone."
else
  echo -e "\nFailed."
fi


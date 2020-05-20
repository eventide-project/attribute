#!/usr/bin/env bash

set -e

if [ -z ${POSTURE+x} ]; then
  echo "(POSTURE is not set. Using \"operational\" by default.)"
  posture="operational"
else
  posture=$POSTURE
fi

echo
echo "Installing gems locally (posture: $posture)"
echo '= = ='

rm -rf Gemfile.lock ./gems

cmd="gem install --install-dir=./gems --bindir=./gems/bin --file Gemfile --lock"

if [ operational != "$posture" ]; then
  cmd="$cmd --development"
fi

echo $cmd
($cmd)

echo
echo "Writing standalone bundle loader file"
echo "- - -"
echo

mkdir -p ./gems/bundler

for gem in $(ls ./gems/gems); do
  load_path="$:.unshift(File.expand_path('../gems/$gem/lib', __dir__))"

  echo $load_path >> ./gems/bundler/setup.rb
done

cat ./gems/bundler/setup.rb
echo

echo '- - -'
echo '(done)'
echo

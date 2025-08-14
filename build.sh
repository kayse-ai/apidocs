#!/bin/bash
set -e

echo "Installing Ruby dependencies..."
bundle install

echo "Building Middleman site..."
bundle exec middleman build

echo "Build completed. Contents of build directory:"
ls -la build/
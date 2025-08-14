#!/bin/bash
set -e

echo "Cleaning previous build..."
rm -rf build/

echo "Installing Ruby dependencies..."
bundle install

echo "Building Middleman site..."
bundle exec middleman build

echo "Build completed. Contents of build directory:"
ls -la build/

echo "Build is ready for deployment to Vercel!"
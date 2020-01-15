#!/bin/bash

set -o nounset
set -o errexit

echo "Linting..."
CI=true npm test

echo "Building..."
SKIP_PREFLIGHT_CHECK=true REACT_APP_API_SECRETIN=https://api.secret-in.me yarn run build

echo "Pre-deploy tasks..."
cp build/index.html build/404.html

echo "Deploying..."
./node_modules/.bin/gh-pages -d build

#!/bin/sh

# Fail on any error.
set -o errexit
# Display commands to stderr.
set -o xtrace

git describe --tags  # non-zero exit code (no tag found) will fail the script
readonly EXTENSION_NAME=$( git describe --tags | sed -e 's/^v[0-9.]\+-//')

cd github/jib-extensions
./gradlew ":${EXTENSION_NAME}:prepareRelease"
# `before_deploy` phase: here we package the build artifacts

set -ex

# create a "staging" directory
mkdir staging

cp bin/ergo staging

cd staging

# release tarball will look like 'go-ergo-v1.2.3-x86_64-unknown-linux-gnu.tar.gz'
if [ -n "$TARGET" ]; then
  echo "Creating package for $TARGET"
  tar czf ../${PROJECT_NAME}-${TRAVIS_TAG}-${TARGET}.tar.gz *
else
  echo "Skipping..."
fi

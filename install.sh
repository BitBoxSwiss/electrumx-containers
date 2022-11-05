# The script is expected to run from within a container as root.
# It installs electrumx server of the specified version.

set -eu  # abort on first error

# Tue, 5 Nov 2022 02:44 +0100
VERSION=2f3e891a524df28538ba9b85a36a8bfecd22b1bd
SHA256=577bd2da5a8cc916cdec6bcc70f71b8b0ca37e858cc0d5ec7ef0620bcca3e3d8
SOURCE_URL=https://github.com/spesmilo/electrumx/archive/$VERSION.tar.gz

cd /
printf "VERSION: $VERSION\nSOURCE: $SOURCE_URL\n" > VERSION
curl -sSL -o src.tar.gz $SOURCE_URL
printf "$SHA256 src.tar.gz" | sha256sum

mkdir /src
tar -C /src -xzf src.tar.gz --exclude='*/tests/*' --strip-components=1
cd /src
python setup.py install

cd /
rm -rf src

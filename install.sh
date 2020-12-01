# The script is expected to run from within a container as root.
# It installs electrumx server of the specified version.

set -eu  # abort on first error

# Tue, 10 Nov 2020 19:31:34 +0100
VERSION=bf430353d635eeaf1d4fc0f107d6b947846e1d7f
SHA256=f7157590349db177c974545e8e3909df59244aaa73cb910b7b4dec4b2845bd54
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

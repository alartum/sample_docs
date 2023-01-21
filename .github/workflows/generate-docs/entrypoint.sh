#!/bin/sh -l

set -e  # if a command fails it stops the execution
set -u  # script fails if trying to access to an undefined variable

echo "[+] Action start"
DOCS_DIRECTORY="${1:-docs}"
ENVIRONMENT_YAML="${2:-environment.yaml}"
DOCUMENTATION_FORMAT="${3:-html}"
SYMLINK_NAME="${4}"

if [ -z "$SYMLINK_NAME" ]
then
	SYMLINK_NAME="$(basename $(pwd))"
fi

echo "[+] Reading environment from $ENVIRONMENT_YAML"
cat $ENVIRONMENT_YAML

echo "[+] Installing dependencies"
mamba env update --name base --file $ENVIRONMENT_YAML

echo "[+] Generate documentation"
cd $DOCS_DIRECTORY
# Symlink creation to work around the Sphinx inability to see the parent
# directory
SYMLINK_PATH="source/$SYMLINK_NAME"
if [ -e $SYMLINK_PATH ] ; then
	echo "Symlink ($SYMLINK_PATH) already exists, removing."
    rm -rf "$SYMLINK_PATH"
fi
echo "Creating symlink ($SYMLINK_PATH)."
ln -s ../.. $SYMLINK_PATH
sphinx-apidoc -f -o source/ ..
make $DOCUMENTATION_FORMAT

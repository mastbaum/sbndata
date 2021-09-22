#!/bin/bash

if [ $# != 1 ]
then
    echo Usage: make_ups_product.sh VERSION
    exit 2
fi

version=$1

prodname_lower=sbndata
prodname_mixed=SBNdata
prodname_upper=SBNDATA

INCS=""
BINS=''

dest=$prodname_lower/$version

mkdir -p $dest || exit 1

mkdir -p ${dest}/include/${prodname_mixed} || exit 1
echo "Copying files to ${dest}/include"
cp $INCS $dest/include/${prodname_mixed}

mkdir -p ${dest}/bin || exit 1
echo "Copying files to ${dest}/bin"
cp $BINS $dest/bin


echo "Creating table file.."
mkdir -p ${dest}/ups || exit 1

cat >$dest/ups/${prodname_lower}.table <<EOF
EOF
FILE=TABLE
PRODUCT=${prodname_lower}
VERSION=${version}

FLAVOR=ANY
QUALIFIERS=e20:debug

ACTION=SETUP
  setupEnv()
  proddir()
  EnvSet(${prodname_upper}_VERSION, \${UPS_PROD_VERSION} )
  EnvSet(${prodname_upper}_INC, \${UPS_PROD_DIR}/include )
  pathPrepend(PATH, \${UPS_PROD_DIR}/bin )

  setupRequired(root v6_22_08b -q +e20:+debug)

FLAVOR=ANY
QUALIFIERS=e20:prof

ACTION=SETUP
  setupEnv()
  proddir()
  EnvSet(${prodname_upper}_VERSION, \${UPS_PROD_VERSION} )
  EnvSet(${prodname_upper}_INC, \${UPS_PROD_DIR}/include )
  pathPrepend(PATH, \${UPS_PROD_DIR}/bin )

  setupRequired(root v6_22_08b -q +e20:+prof)

FLAVOR=ANY
QUALIFIERS=c7:debug

ACTION=SETUP
  setupEnv()
  proddir()
  EnvSet(${prodname_upper}_VERSION, \${UPS_PROD_VERSION} )
  EnvSet(${prodname_upper}_INC, \${UPS_PROD_DIR}/include )
  pathPrepend(PATH, \${UPS_PROD_DIR}/bin )

  setupRequired(root v6_22_08b -q +c7:+debug)

FLAVOR=ANY
QUALIFIERS=

ACTION=SETUP
  setupEnv()
  proddir()
  EnvSet(${prodname_upper}_VERSION, \${UPS_PROD_VERSION} )
  EnvSet(${prodname_upper}_INC, \${UPS_PROD_DIR}/include )
  pathPrepend(PATH, \${UPS_PROD_DIR}/bin )

  setupRequired(root v6_22_08b -q +c7:+prof)


EOF

echo ${dest}.version
mkdir ${dest}.version || exit 1

for qual in e20:debug e20:prof c7:debug c7:debug
do
cat > ${dest}.version/NULL_$qual <<EOF
EOF
FILE = version
PRODUCT = $prodname_lower
VERSION = $version

FLAVOR = NULL
QUALIFIERS = "$qual"
  PROD_DIR = $prodname_lower/$version/
  UPS_DIR = ups
  TABLE_FILE = $prodname_lower.table
EOF
done

echo You can set up this product with:
echo "setup $prodname_lower $version -z `pwd`:\$PRODUCTS -q e20:debug e20:prof c7:debug c7:debug"

EOF
EOF

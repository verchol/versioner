

#!/bin/bash
read a b c
echo 'next version is' $a
cf_export SEMVER_VERION = $a

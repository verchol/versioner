commit=$1
#echo 'looking for match for' $1
ERROR="fatal: no tag exactly matches"
git describe --exact-match $commit 2>v 1>v1
TAG=$(cat v)
echo $(cat v1)
echo tag $TAG
if echo "$TAG" | grep -q "$ERROR"; then
  echo "no tag detected";
else
  echo "there is tag";
  mkdir -p /codefresh/volume/cache  
  echo TAG=$(cat v1)>/codefresh/volume/cache/tag
fi

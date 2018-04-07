
export CODEFRESH_VOLUME=/codefresh/volume/cache

if [ -z "$RELEASE_VERSION" ];
 then
   export RELEASE_VERSION='1.0.0'
   echo 'set cf default release version  '
fi

if [ ! -z "$VOLUME" ];
 then
   export CODEFRESH_VOLUME=$VOLUME
   echo 'set cf volume '
fi
echo 'volume' = $CODEFRESH_VOLUME

if [ ! -f $CODEFRESH_VOLUME/lastversion ];
  then echo 'file does not exist'
  mkdir -p $CODEFRESH_VOLUME && true
  echo $CODEFRESH_VOLUME created
  ls -l $CODEFRESH_VOLUME
  touch $CODEFRESH_VOLUME/lastversion
  echo release is $RELEASE_VERSION
  echo $RELEASE_VERSION > $CODEFRESH_VOLUME/lastversion
fi

cat  $CODEFRESH_VOLUME/lastversion
echo is new release - $RELEASE_VERSION
if [ ! -z "$RELEASE_VERSION"] ;
then
  echo new release is $NEW_RELEASE
  echo "new release is added"
  export VERSION=$RELEASE_VERSION
else
export VERSION=$(cat $CODEFRESH_VOLUME/lastversion)
fi
echo 'current version is ' $VERSION
cat $CODEFRESH_VOLUME/lastversion
node ./cli increment --version $VERSION | cat > $CODEFRESH_VOLUME/lastversion


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
  then echo 'file not exists'
  mkdir $CODEFRESH_VOLUME && true
  touch $CODEFRESH_VOLUME/lastversion
  echo release is $RELEASE_VERSION
  echo $RELEASE_VERSION > $CODEFRESH_VOLUME/lastversion
fi

cat  $CODEFRESH_VOLUME/lastversion
echo '----'
if [ ! -z "$NEW_RELEASE" ];
then
  echo "new release is added" && rm $CODEFRESH_VOLUME/lastversion
  export VERSION=$RELEASE_VERSION
else
export VERSION=$(cat $CODEFRESH_VOLUME/lastversion)
fi
echo 'current version is ' $VERSION
cat $CODEFRESH_VOLUME/lastversion && echo 'was last version'
node ./cli increment --version $VERSION | cat > $CODEFRESH_VOLUME/lastversion
#cf_export CF_VERSION=$(cat $CODEFRESH_VOLUME/lastversion)

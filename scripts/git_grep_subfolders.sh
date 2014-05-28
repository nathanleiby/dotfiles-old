SUB_DIRS="ls -d */"
for i in $( $SUB_DIRS ); do
  pushd $i >> /dev/null
  echo "==== DIR: `pwd` ===="
  git grep $1
  popd >> /dev/null
done

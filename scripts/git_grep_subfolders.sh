SUB_DIRS="ls -d */"
for i in $( $SUB_DIRS ); do
  pushd $i
  git grep $1
  popd
done

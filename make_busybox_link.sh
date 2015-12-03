./busybox  --help | \
sed -e '1,/^Currently defined functions:/d' \
    -e 's/[ \t]//g' -e 's/,$//' -e 's/,/\n/g' | \
while read app ; do
  if [ "$app" != "" ]; then
    printf "linking %-12s ...\n" "$app"
    ln -sf "./busybox" "$app"
    ls -ld "$app"
  fi
done

# loggi.sh
#
# Description: Loggi utilities

cd /opt/loggi/web/loggi

# Run tests
lt() {
  loggi test --disable-warnings -n0 -s $@
}

# Use fswatch to run some tests
ltw() {
  fswatch modify . loggi test -x --reuse-db -vvv -n0 -s --disable-warnings $@
}

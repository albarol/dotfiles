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
  fswatch modify . loggi test -x --reuse-db -vvv -n0 -s --disable-warnings --pdb $@
}

# Run
run() {
  loggi run
}

# Celery
celery() {
  loggi celery
}

generate-notfis() {
  local NOTFIS="${HOME}/.desk/loggi/renner.notfis"
  local PACKLIST=$(cat /dev/urandom | tr -dc '0-9' | fold -w 9 | head -n 1)
  local KEY=$(cat /dev/urandom | tr -dc '0-9' | fold -w 11 | head -n 1)
  local NUM_NF=$(cat /dev/urandom | tr -dc '0-9' | fold -w 8| head -n 1)

  local TEMP=$(mktemp).notfis

  cat $NOTFIS |sed -re "s/\{PACKLIST\}/${PACKLIST}/g" |sed -re "s/\{KEY\}/${KEY}/g" |sed -re "s/\{NUM_NF\}/${NUM_NF}/g" > $TEMP
  echo $TEMP
}

# transfer.sh
#
# Description: Transfer utilities

cd /opt/loggi/transfer

# Run transfer app
__transfer_main() {
  docker-compose start 1&>/dev/null
  export TRANSFER_IP=$(edocker inspect transfer_transfer_1 |grep -w IPAddress |sed -re 's/.*"([0-9.]+)",/\1/'|uniq)
}

# Use fswatch to run some tests
health() {
  curl "http://${TRANSFER_IP}:9021/health"
}

__transfer_main

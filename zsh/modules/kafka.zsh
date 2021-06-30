# kafka
export DOCKER_KAFKA_HOST=$(ipconfig getifaddr en0) # mirror-maker

topic_count() {
  # brokers list
  # topic
  echo "Counting topic $2 from brokers $1"
  kafka-run-class kafka.tools.GetOffsetShell --broker-list $1 --time -1 --topic $2 | awk -F ":" '{sum += $3} END {print sum}'
}
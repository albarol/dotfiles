# ffmpeg.sh
#
# Description: ffmpeg  utilites

# Extract part of audio
audio-extract() {
  BASENAME=$(echo $1 |awk -F'.' '{print $1}')
  EXTENSION=$(echo $1 |awk -F'.' '{print $2}')
  ffmpeg -ss $2 -t $3 -i $BASENAME.$EXTENSION $BASENAME-output.$EXTENSION
}

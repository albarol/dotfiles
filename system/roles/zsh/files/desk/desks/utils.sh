# Desk utils
#
# Description: Utils functions


# Youtube Downloader

# (youtube-dl) Download audio
yt-audio-download() {
	youtube-dl --extract-audio --audio-format mp3 $@
}

# FFMPEG

# (ffmpeg) Extract part of audio
ffmpeg-audio-extract() {
  BASENAME=$(echo $1 |awk -F'.' '{print $1}')
  EXTENSION=$(echo $1 |awk -F'.' '{print $2}')
  ffmpeg -ss $2 -t $3 -i $BASENAME.$EXTENSION $BASENAME-output.$EXTENSION
}

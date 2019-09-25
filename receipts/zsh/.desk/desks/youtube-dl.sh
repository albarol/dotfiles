# youtube-dl.sh
#
# Description: Youtube Downloader utilites

# Download audio
audio-download() {
	youtube-dl --extract-audio --audio-format mp3 $@
}

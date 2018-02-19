# react-android.sh
#
# Description: Reactive android utilites

# Reload app
reloadapp() {
	adb shell input keyevent 46 46
}

# Reload automatically if there is some change
autoreload() {
  fswatch modify . adb shell input keyevent 46 46
}

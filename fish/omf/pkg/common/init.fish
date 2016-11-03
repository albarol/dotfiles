function init -a path --on-event init_common
    # GO PATH
    set -gx PATH /usr/local/go/bin $PATH
    set -gx GOPATH $HOME/.go

    # ANDROID PATH
    set -gx ANDROID_HOME $HOME/.android
    set -gx ANDROID_SDK_HOME /opt/android-sdk-linux
    set -gx PATH $ANDROID_SDK_HOME/tools/ $ANDROID_SDK_HOME/platform-tools/ $PATH

end

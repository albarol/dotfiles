function init -a path --on-event init_common
    # GO PATH
    if [ -d /usr/local/go/bin ]
        set -gx PATH /usr/local/go/bin $PATH
        set -gx GOPATH $HOME/.go
    end

    # ANDROID PATH
    if [ -d $HOME/.android-sdk ]
        set -gx ANDROID_SDK_HOME $HOME/.android-sdk
        set -gx ANDROID_HOME $ANDROID_SDK_HOME/.android
        set -gx PATH $ANDROID_SDK_HOME/tools/ $ANDROID_SDK_HOME/platform-tools/ $PATH
    end

    # NPM PATH
    if [ -d $HOME/.npm-global ]
        set -gx PATH $HOME/.npm-global $PATH
    end

    # JAVA PATH
    if [ -d /opt/android-studio/jre ]
        set -gx JAVA_HOME /opt/android-studio/jre
    end
end

# settings initialization hook
#
# You can use the following variables in this file:
# * $package       package name
# * $path          package path
# * $dependencies  package dependencies
#

function init -a path --on-event init_settings
    set -g SETTINGS_ERROR 5

    autoload $path/functions/{cli}
end

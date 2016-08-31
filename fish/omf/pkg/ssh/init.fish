function init -a path --on-event init_ssh
    set -gx OMF_SSH_TUNNEL_DB ~/.config/.omf_ssh_tunnel.db
end


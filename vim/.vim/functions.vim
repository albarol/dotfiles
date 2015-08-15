
command! -nargs=1 FindInFiles execute "vimgrep /".<f-args>."/j **" <Bar> cw

# Defined in /home/rw/.config/fish/config.fish @ line 30
function cwd
	pwd | sed 's/.*/"&"/'
end

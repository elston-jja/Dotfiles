echo -n "Please enter the link: "
read link
nohup youtube-dl -q -o- $link | mplayer -cache 8912 - &> /dev/null

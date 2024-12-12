if [ -z $TMUX ]; then
    SESSION=PUSSY
    tmux attach -t $SESSION || tmux new -s $SESSION
fi

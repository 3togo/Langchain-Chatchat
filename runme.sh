#! /bin/bash
do_cmd(){
    echo "$@"
    eval $@
}

reset
# pip install streamlit==1.33.0
. ~/jvenv311/bin/activate
./shutdown_all.sh
#for port in 20000 20001 20002 7861 8501; do
#    do_cmd fuser -k $port/tcp
#done
# python -m pip install "pydantic>=1.10.11,<2.0"
python runme.py -a


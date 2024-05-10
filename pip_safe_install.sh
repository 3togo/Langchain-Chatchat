#! /bin/bash
# 检查是否提供了至少一个参数
do_cmd(){
    echo $@
    $@
    [[ $? -ne 0 ]] && echo "do_cmd failed" && exit 1
}
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <requirements.txt>"
    exit 1
fi

# 遍历所有提供的参数
for arg in "$@"; do
    # 检查参数是否以.txt结尾
    if [[ $arg == *.txt ]]; then
        # 如果是，运行pip install -r

        #prgs="$(cat $arg|grep -vE '^$|^#|#$'|sed 's/\([^=<>!&#126;^&#126;]*\)[=<>].*$/\1/g'| awk -F'==' '{print $1}')"
        prgs="$(cat $arg|sed 's/\([^=<>!&#126;^&#126;]*\)[=<>].*$/\1/g'|grep -vE '^$|^#|#$')"
        prgs="${prgs//$'\n'/ }"
        prgs="${prgs//#/}"
        echo "prgs=$prgs"
        [[ -z "$prgs" ]] && echo "nothing to install for $arg" && continue
        do_cmd pip install $prgs
    else
        echo "Warning: '$arg' does not end with .txt. Skipping..."
    fi
done

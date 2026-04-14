#!/bin/bash

uv run pyiqa -t imgs/ arniqa brisque clipiqa+ hyperiqa ilniqe laion_aes liqe maniqa musiq nima-koniq niqe piqe qalign qualiclip+ topiq_iaa tres unique wadiqam_nr -v \
    | sed -n '/^{/,$p' \
    | sed '$!b; s/}[^}]*$/}/' \
    | python3 -c 'import sys, ast, json; print(json.dumps(ast.literal_eval(sys.stdin.read().replace("np.float64(", "(")), indent=4))' \
    > evaluation/iqa/res_2.json





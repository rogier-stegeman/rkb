Update all `>=` in requirements.txt:
`python -m pip freeze | awk '!x {v[$1] = $2; next} NF>1 && $1 in v {$0 = $1"=="v[$1]} {print}' FS='==' - x=1 FS='>=' requirements.txt >> requirements2.txt && cat requirements2.txt > requirements.txt && rm requirements2.txt`

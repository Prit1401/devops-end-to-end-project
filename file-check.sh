
#!/bin/bash

for file in notes.txt hello.sh health-check.sh
do
    if [ -f "$file" ]; then
        echo "FOUND: $file"
    else
        echo "MISSING: $file"
    fi
done


#!/bin/bash

FILE="notes.txt"

if [ -f "$FILE" ]; then
    echo "SUCCESS: $FILE exists."
    exit 0
else
    echo "ERROR: $FILE does not exist."
    exit 1
fi


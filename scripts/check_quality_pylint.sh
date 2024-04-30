SCRIPT_DIR=$(dirname "$(realpath "$0")")
cd "$SCRIPT_DIR/../movies"
output=$(pylint .)
rating=$(echo "$output" | grep -oP "Your code has been rated at \K(\d+\.\d+)")
threshold=7.0
if (( $(echo "$rating > $threshold" | bc -l) )); then
    echo "Pylint score ($rating) is good (greater than $threshold)."
    exit 0
else
    echo "Pylint score ($rating) is not sufficient (less than or equal to $threshold)."
    exit 1
fi


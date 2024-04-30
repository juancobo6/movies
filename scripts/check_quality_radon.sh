SCRIPT_DIR=$(dirname "$(realpath "$0")")
echo "Checking Python code with radon..."
cd "$SCRIPT_DIR/../movies"
output=$(radon cc -a .)
average_cc=$(echo "$output" | tail -n 1 | awk '{print $NF}' | tr -d '()')
threshold=10
if (( $(echo "$average_cc < $threshold" | bc -l) )); then
    echo "Radon cc avg score ($average_cc) is good (less than $threshold)."
    exit 0
else
    echo "Radon cc avg score ($average_cc) is not sufficient (greater than or equal to $threshold)."
    exit 1
fi

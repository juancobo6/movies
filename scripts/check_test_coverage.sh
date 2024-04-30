threshold=90
SCRIPT_DIR=$(dirname "$(realpath "$0")")
TEST_DIR="$SCRIPT_DIR/../tests"
cd "$SCRIPT_DIR/.."
output=$(python3 -m pytest "$TEST_DIR" --cov=movies)
coverage=$(echo "$output" | grep "TOTAL" | awk '{print $NF}' | tr -d '%')
echo "Coverage percentage: $coverage %"
if (( $(echo "$coverage >= $threshold" | bc -l) )); then
    echo "Coverage meets or exceeds 90 % threshold."
    exit 0
else
    echo "Coverage does not meet 90 % threshold."
    exit 1
fi
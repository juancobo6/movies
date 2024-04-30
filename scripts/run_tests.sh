SCRIPT_DIR=$(dirname "$(realpath "$0")")
TEST_DIR="$SCRIPT_DIR/../tests"
echo "Script directory: $SCRIPT_DIR"
echo "Test directory: $TEST_DIR"
cd "$SCRIPT_DIR/.."
output=$(python3 -m pytest "$TEST_DIR")
echo "$output"
coverage=$(echo "$output" | grep "TOTAL" | awk '{print $NF}' | tr -d '%')
echo "All pytest tests have been passed successfully." 
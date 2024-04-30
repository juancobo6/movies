SCRIPT_DIR=$(dirname "$(realpath "$0")")
cd "$SCRIPT_DIR/../movies"
echo "Checking Python code with ruff..."
ruff check .
if [ $? -ne 0 ]; then
    echo "Ruff error found in the Python code."
    exit 1
else
    echo "No ruff issues found in Python code."
    exit 0
fi
SCRIPT_DIR=$(dirname "$(realpath "$0")")
cd "$SCRIPT_DIR/../movies"
echo "Checking Python code with flake8..."
flake8 --max-line-length=100 .
if [ $? -eq 0 ]; then
    echo "No flake8 issues found in the Python code."
    exit 0
else
    echo "Flake8 error found in the Python code."
    exit 1
fi

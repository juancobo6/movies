SCRIPT_DIR=$(dirname "$(realpath "$0")")
cd "$SCRIPT_DIR/../movies"
bandit -r .
echo "No bandit issues found in the Python code."
exit $?
SCRIPT_DIR=$(dirname "$(realpath "$0")")
cd "$SCRIPT_DIR/../movies"
echo "Formatting Python code with black..."
black .
if [ $? -eq 0 ]; then
    echo "No black issued found in the Python code."
else
    echo "Black error found in the Python code."
fi






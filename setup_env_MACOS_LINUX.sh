#!/bin/bash

# Function to check for Python version
check_python_version() {
    for version in "3.12" "3.11" "3.10" "3.9"; do
        if command -v python$version &> /dev/null; then
            echo "Found Python $version"
            PYTHON_CMD="python$version"
            return 0
        fi
    done
    echo "Compatible Python version (3.9 - 3.12) not found. Please install Python 3.9, 3.10, 3.11, or 3.12."
    exit 1
}

# Check for Python version
check_python_version

# Create virtual environment
$PYTHON_CMD -m venv nn_venv
if [ $? -ne 0 ]; then
    echo "Failed to create virtual environment."
    exit 1
fi

# Activate the virtual environment
source nn_venv/bin/activate

# Install required packages
pip install pandas numpy matplotlib scikit-learn scipy seaborn statsmodels tensorflow jupyter 'pandas[excel]'

echo -e "\nSetup complete!"
echo "To run exercises, remember to activate the virtual environment with:"
echo "  source nn_venv/bin/activate"
echo "Then run Jupyter Notebook with:"
echo "  jupyter notebook"

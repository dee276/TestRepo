#!/bin/bash

# Highlighted Skills:
# - File search: find
# - Regex: grep, sed
# - File reading/writing
# - Directory navigation
# - Installing a package

echo "🧭 Starting log parser script..."

# 1. Move to a directory (or create and go there)
mkdir -p ~/log_analyzer
cd ~/log_analyzer || exit
echo "📁 Now in $(pwd)"

# 2. Create some sample log files
echo "Creating sample logs..."
cat <<EOF > sample1.log
INFO: Server started at 10:00
ERROR: Disk failure on /dev/sda1
WARNING: High memory usage
EOF

cat <<EOF > sample2.log
INFO: User login
ERROR: Unable to connect to database
DEBUG: Connection retry
EOF

# 3. Search for all .log files recursively
echo "🔍 Searching for .log files..."
find . -type f -name "*.log" > log_file_list.txt
echo "Found log files:"
cat log_file_list.txt

# 4. Read those files and extract lines matching a regex (ERROR messages)
echo "⚠️ Extracting error messages using regex..."
> error_summary.txt
while read -r logfile; do
    grep -E "ERROR: .+" "$logfile" >> error_summary.txt
done < log_file_list.txt

# 5. Use sed to add timestamps to the error lines
sed -i "s/^/[$(date '+%Y-%m-%d %H:%M:%S')] /" error_summary.txt

echo "✅ Error summary:"
cat error_summary.txt

# 6. Install a package (tree) if not installed
if ! command -v tree &> /dev/null; then
    echo "🌱 'tree' not found. Installing it..."
    sudo apt-get update && sudo apt-get install -y tree
else
    echo "🌳 'tree' is already installed."
fi

# 7. Show the directory structure using tree
echo "📂 Directory structure:"
tree .

echo "✅ Script complete."

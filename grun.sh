  GNU nano 5.4                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             grun.sh
#!/bin/bash

# Display usage if arguments are missing
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <subdomains_file> <output_directory>"
    echo "Example: $0 subdomains.txt gau_results"
    exit 1
fi

INPUT_FILE="$1"
OUTPUT_DIR="$2"

# 1. Check if 'gau' is actually installed
if ! command -v gau &> /dev/null; then
    echo "Error: 'gau' is not installed or not in your PATH."
    echo "Please install it first: go install github.com/lc/gau/v2/cmd/gau@latest"
    exit 1
fi

# Check if input file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: File '$INPUT_FILE' not found!"
    exit 1
fi

# Create the output directory if it doesn't exist
if [ ! -d "$OUTPUT_DIR" ]; then
    echo "Creating directory: $OUTPUT_DIR"
    mkdir -p "$OUTPUT_DIR"
fi

echo "Starting GAU automation..."
echo "Reading from: $INPUT_FILE"
echo "Saving to: $OUTPUT_DIR/"
echo "----------------------------------------"

# Loop through each line in the text file
while IFS= read -r raw_subdomain || [ -n "$raw_subdomain" ]; do
    # Skip empty lines or lines starting with #
    [[ -z "$raw_subdomain" || "$raw_subdomain" =~ ^# ]] && continue

    # Sanitize the filename: remove http://, https://, and trailing slashes
    clean_name=$(echo "$raw_subdomain" | sed -E 's#^https?://##' | sed 's#/$##')

    echo "[+] Running gau on: $clean_name"

    # Run gau and save to file
    # We use 'timeout 10m' to prevent one massive domain from blocking the script forever.
    # If you don't have 'timeout' installed (Mac), just remove "timeout 10m"
    gau "$clean_name" > "$OUTPUT_DIR/$clean_name.txt"

    # Check if the file is empty (no results found)
    if [ ! -s "$OUTPUT_DIR/$clean_name.txt" ]; then
        echo "    (No URLs found or connection failed)"
        # Optional: Delete empty files to reduce clutter
        rm "$OUTPUT_DIR/$clean_name.txt"
    else
        line_count=$(wc -l < "$OUTPUT_DIR/$clean_name.txt")
        echo "    -> Saved $line_count URLs to $clean_name.txt"
    fi

done < "$INPUT_FILE"

echo "----------------------------------------"
echo "Process complete! Check the '$OUTPUT_DIR' folder."












🔍 GAU Bulk Scanner
A robust automation wrapper for the GAU (Get All Urls) tool. This script allows you to feed a list of thousands of subdomains, run gau on each one, and organize the results into clean, individual text files.
Note: This is a wrapper script. You must have the original gau tool installed for this to work.
⚡ Features
Bulk Processing: Takes a text file containing a list of domains/subdomains.
Automated Sanitization: Automatically strips http://, https://, and trailing slashes from filenames to prevent errors.
Smart Storage: Saves results in a specified directory, creating a unique .txt file for each domain.
Memory Safe: (Python Version) Streams output directly to disk, allowing it to handle massive targets without crashing RAM.
Cleanup: Automatically removes empty files if gau returns no results for a specific domain.
🛠️ Prerequisites
You must have Go and GAU installed.
Install Go: https://go.dev/doc/install
Install GAU:
go install [github.com/lc/gau/v2/cmd/gau@latest](https://github.com/lc/gau/v2/cmd/gau@latest)

Make sure your Go bin directory is in your system $PATH.
🚀 Usage
You can use either the Bash version or the Python version. Both do the same thing.
Option 1: Bash Script (Linux/macOS)
Clone this repository or download gau_runner.sh.
Give it execution permissions:
chmod +x gau_runner.sh


Run it:
./gau_runner.sh <list_of_domains.txt> <output_folder_name>


Example:
./gau_runner.sh subdomains.txt my_bounty_results


Option 2: Python Script (Cross-Platform)
Clone this repository or download gau_runner.py.
Run it using Python 3:
python3 gau_runner.py <list_of_domains.txt> <output_folder_name>


Example:
python3 gau_runner.py targets.txt archive_results


📂 Output Structure
The script will create the output directory and populate it like this:
📂 my_bounty_results/
├── 📄 example.com.txt
├── 📄 api.example.com.txt
├── 📄 dev.test.com.txt
└── ...


⚠️ Disclaimer
This tool is for educational purposes and security research only. Ensure you have permission to scan the targets you are running this on. The author is not responsible for any misuse.
🤝 Credits
GAU Tool: Created by Corben Leo (lc)

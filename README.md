# ⚡ Grun

**Grun** is a high-performance automation wrapper for the [GAU (Get All Urls)](https://github.com/lc/gau) tool. It turns GAU into a bulk scanning machine, allowing you to feed it a list of thousands of subdomains, automatically process them, and organize the results into clean, deduplicated files.

> **Note:** Grun relies on the original `gau` binary. You must have it installed for this tool to work.

## ✨ Features

* **Bulk Target Support:** Accepts a simple text file with thousands of subdomains.
* **Smart Sanitization:** Automatically cleans input (removes `https://`, `http://`, and trailing slashes) to ensure valid filenames.
* **Streamlined Storage:** Creates a structured output directory with a unique `.txt` file for every subdomain.
* **Resource Efficient:**
    * **Python Mode:** Streams output directly to disk to handle massive datasets without consuming RAM.
    * **Bash Mode:** Fast, native execution for Linux/macOS environments.
* **Auto-Cleanup:** Automatically detects and removes empty result files to keep your workspace clean.

## 🛠️ Prerequisites

1.  **Install Go:** [https://go.dev/doc/install](https://go.dev/doc/install)
2.  **Install GAU:**
    ```bash
    go install [github.com/lc/gau/v2/cmd/gau@latest](https://github.com/lc/gau/v2/cmd/gau@latest)
    ```
    *Ensure your Go binary path (usually `~/go/bin`) is added to your system `$PATH`.*

## 🚀 Installation

1.  Clone the repository:
    ```bash
    git clone [https://github.com/YOUR_USERNAME/grun.git](https://github.com/YOUR_USERNAME/grun.git)
    cd grun
    ```
2.  Make the script executable (Linux/Mac):
    ```bash
    chmod +x gau_runner.sh
    ```

## 📖 Usage

You can use either the **Bash** script or the **Python** script. They perform identical actions.

### 🐧 Option 1: Bash (Linux/macOS)
Best for quick scans on Unix systems.

```bash
./gau_runner.sh <input_file> <output_directory>

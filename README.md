# Python Installer

This repository provides a simple setup for building and installing specific Python versions using Docker and Make. The
project is designed for users who want to build Python installations in a controlled, reproducible environment without
installing the build dependencies locally.

## Features

- Build custom Python versions in isolated Docker containers.
- Install Python versions locally after building.
- Simplify build and install processes with a Makefile.

## Prerequisites

- [Docker](https://www.docker.com/) installed and running.
- [Make](https://www.gnu.org/software/make/) installed.
- A Unix-based system (tested on Ubuntu 22.04).

## Usage

### Clone the Repository

```bash
git clone https://github.com/martijnkorbee/python-installer.git
cd python-installer
```

### Build a Python Version

Use the Makefile to build a specific Python version:

```bash
make build PYTHON_VERSION=<python_version> BUILD_OPTIONS=<build_options>
```

Replace `<python_version>` with the desired version (e.g., `3.11.11`) or set the default in the Makefile.  
Replace `<build_options>` with the desired configuration or set the default in the Makefile.

> Python configure documentation: [Python Configure](https://docs.python.org/3/using/configure.html).

### Install the Built Python Version

After building, install the Python version locally:

```bash
make install PYTHON_VERSION=<python_version> INSTALL_DIR=<install_dir>
```

Replace `<python_version>` with your version or set the default in the Makefile.  
Replace `<install_dir>` with the desired installation directory or set the default in the Makefile.

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

This project is licensed under the [MIT License](LICENSE).

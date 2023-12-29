# Technical Demo Study Notes

## 1. Tools and Packages

### 1.1 Build Tools

- **Autoconf**: Produces shell scripts that automatically configure software source code packages to adapt to many kinds of Unix-like systems.
- **Dpkg-dev**: A collection of tools used to create Debian packages. Includes dpkg-source, dpkg-gencontrol, and others.
- **Dpkg**: The base package management system for Debian. It installs, removes, and provides information about .deb packages.
- **File**: A utility that classifies file types. Often used in build processes to determine how to handle different file types.
- **Make**: A build automation tool that automatically builds executable programs and libraries from source code by reading files called Makefiles.
- **Re2c**: A tool for writing very fast and very flexible scanners. Often used in build processes to generate source code for tokenizers.

### 1.2 Compilers

- **G++**: The GNU C++ compiler. Needed for compiling C++ source code.
- **Gcc**: The GNU C Compiler. Needed for compiling C source code.

### 1.3 Libraries and Development Files

- **Libc-dev**: The development files for the C library. Needed for compiling programs against the standard C library.
- **Pkgconf**: Helps to configure compiler and linker flags for development libraries. It's a replacement for pkg-config.
- **Openssl-dev**: Development files for OpenSSL, a robust, full-featured open-source toolkit.
- **Curl-dev**: Development files for cURL, a tool for transferring data with URL syntax.

### 1.4 Utilities

- **Coreutils**: The basic file, shell and text manipulation utilities of the GNU operating system.
- **Tar**: A utility for creating and extracting tarball files. Tarballs are a common format for distributing source code and binary packages.
- **Xz**: A command-line tool for compressing and decompressing files. The xz format provides high compression ratios, which is useful for reducing the size of files.

### 1.5 Network and Security

- **Ca-certificates**: Contains the Certificate Authority certificates used by the SSL library. Needed for making secure connections over HTTPS.
- **Curl**: A command-line tool for making HTTP requests. Often used in scripts and Dockerfiles for downloading files from the internet.
- **Openssl**: A robust, full-featured open-source toolkit that implements the Secure Sockets Layer (SSL) and Transport Layer Security (TLS) protocols. Used for secure communication over networks.

## 2. Shell Scripting

- **Set -eux**: A command used in shell scripts for debugging and error handling.
    - `-e`: Causes the shell to exit if any invoked command exits with a non-zero status.
    - `-u`: Treats unset variables and parameters as an error and causes the shell to exit.
    - `-x`: Makes the shell print each command to the terminal before executing it.

## 3. Docker Image Tags

- **Bookworm**: A Docker image based on the "Bookworm" release of Debian. Bookworm is the testing distribution of Debian.
- **Bullseye**: A Docker image based on the "Bullseye" release of Debian. Bullseye is the current stable release of Debian.
- **Slim-bookworm**: A "slim" version of the Docker image based on the "Bookworm" release of Debian. It has fewer pre-installed packages.
- **Slim-bullseye**: A "slim" version of the Docker image based on the "Bullseye" release of Debian. It has fewer pre-installed packages.

## 4. Commands

- **apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false**: This command removes packages that were automatically installed to satisfy dependencies for some package and which are no longer needed. The -y flag is used to automatically answer yes to all prompts. The --auto-remove option is used to remove packages that were automatically installed to satisfy dependencies for other packages and are now no longer needed. The -o APT::AutoRemove::RecommendsImportant=false option ensures that even recommended packages that are no longer needed get removed. The purge option differs from remove in that it also removes any configuration files for the packages.

- **rm -rf /var/lib/apt/lists/***: This command removes all the local copies of package lists retrieved from the package repositories. When you run apt-get update, it retrieves package lists from the repositories and stores them in /var/lib/apt/lists/. Over time, this can take up a significant amount of space. By removing these files, you can keep the Docker image size smaller. Note that if you need to install additional packages later, you'll need to run apt-get update again to retrieve the package lists.
# Parsec for Ubuntu with Dependencies Auto Installer

- **Version**: v1.0
- **Date**: 11.07.2023 @ 12:56 PM PST
- **Written by**: Geoff Clark of GDV, LLC

This script automates the installation of specified `.deb` packages for the installation of Parsec on Debian-based Linux systems. It checks for the existence of each package locally, downloads any missing packages using `wget`, and installs them using `dpkg`. Additionally, it resolves any missing dependencies.

## Prerequisites

- `wget`: Utility for non-interactive download of files from the Web.
- `dpkg`: Tool to install, build, remove and manage Debian packages.
- Sudo privileges: Required for installing packages.

## Usage

1. Clone the repository or download the `install_debs.sh` script.
2. Make the script executable: `chmod +x install_debs.sh`.
3. Run the script: `./install_debs.sh`.

## Author Information

- **Author**: [Geoff Clark of GDV, LLC](https://clarktribegames.com)
- **Email**: [geoff@gdv.llc](mailto:geoff@gdv.llc)
- **Socials**:
  [GitHub @aznironman](https://github.com/aznironman)
  [IG: @aznironman](https://instagram.com/aznironman)
  [Twitter: @aznironman](https://www.twitter.com/aznironman)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Third-Party Notices

This script is not endorsed by or affiliated with Parsec or any mentioned package vendors. Parsec is a trademark of Parsec Cloud, Inc., and the software is copyrighted by its respective copyright holders.

No code from Parsec, the dependencies packages, or any other software is included in this script. This script only automates the download and installation of the software using system commands and does not modify any part of the software being installed.

All rights reserved by their respective owners. Users must comply with the licenses and terms of service of the software being installed.

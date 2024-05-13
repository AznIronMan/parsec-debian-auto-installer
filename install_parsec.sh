#!/bin/bash

# Define the download directory
DOWNLOAD_DIR="./"

# Ensure wget is installed
if ! command -v wget &> /dev/null; then
    sudo apt-get update
    sudo apt-get install wget
fi

# Declare an associative array with package names as keys and URLs as values
declare -A DEB_FILES=(
    ["libavutil56_4.4.1-3ubuntu5_amd64.deb"]="http://archive.ubuntu.com/ubuntu/pool/universe/f/ffmpeg/libavutil56_4.4.1-3ubuntu5_amd64.deb"
    ["libcodec2-1.0_1.0.1-3_amd64.deb"]="http://archive.ubuntu.com/ubuntu/pool/universe/c/codec2/libcodec2-1.0_1.0.1-3_amd64.deb"
    ["libdav1d5_0.9.2-1_amd64.deb"]="http://archive.ubuntu.com/ubuntu/pool/universe/d/dav1d/libdav1d5_0.9.2-1_amd64.deb"
    ["libswresample3_4.4.1-3ubuntu5_amd64.deb"]="http://archive.ubuntu.com/ubuntu/pool/universe/f/ffmpeg/libswresample3_4.4.1-3ubuntu5_amd64.deb"
    ["libx264-163_0.163.3060+git5db6aa6-2build1_amd64.deb"]="http://archive.ubuntu.com/ubuntu/pool/universe/x/x264/libx264-163_0.163.3060+git5db6aa6-2build1_amd64.deb"
    ["libavcodec-extra58_4.4.1-3ubuntu5_amd64.deb"]="http://archive.ubuntu.com/ubuntu/pool/universe/f/ffmpeg/libavcodec-extra58_4.4.1-3ubuntu5_amd64.deb"
    ["parsec-linux.deb"]="https://builds.parsec.app/package/parsec-linux.deb"
    ["libjpeg-turbo8-dev_2.0.3-0ubuntu1_amd64.deb"]="http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg-turbo/libjpeg-turbo8-dev_2.0.3-0ubuntu1_amd64.deb"
    ["libjpeg-turbo8_2.0.3-0ubuntu1_amd64.deb"]="http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg-turbo/libjpeg-turbo8_2.0.3-0ubuntu1_amd64.deb"
    ["libjpeg8_8c-2ubuntu8_amd64.deb"]="http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg8-empty/libjpeg8_8c-2ubuntu8_amd64.deb"
    ["libjpeg8-dev_8c-2ubuntu10_amd64.deb"]="http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg8-empty/libjpeg8-dev_8c-2ubuntu8_amd64.deb"
    
)

# Download and install .deb packages
for deb_file in "${!DEB_FILES[@]}"; do
    if [ ! -f "$DOWNLOAD_DIR/$deb_file" ]; then
        wget -P "$DOWNLOAD_DIR" "${DEB_FILES[$deb_file]}"
    fi
    sudo dpkg -i "$DOWNLOAD_DIR/$deb_file"
done

# Check if any dependencies were missed and install them
sudo apt-get install -f

# Fix for PulseAudio config bug in some versions of Ubuntu
[ ! -f /etc/alsa/conf.d/99-pulseaudio-default.conf ] && { [ -f /etc/alsa/conf.d/99-pulseaudio-default.conf.example ] && sudo mv /etc/alsa/conf.d/99-pulseaudio-default.conf.example /etc/alsa/conf.d/99-pulseaudio-default.conf || sudo tee /etc/alsa/conf.d/99-pulseaudio-default.conf.example > /dev/null <<'EOF'
# Default to PulseAudio

pcm.!default {
    type pulse
    hint {
        show on
        description "Default ALSA Output (currently PulseAudio Sound Server)"
    }
}

ctl.!default {
    type pulse
}
EOF
}

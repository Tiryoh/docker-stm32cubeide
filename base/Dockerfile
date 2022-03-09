FROM azul/zulu-openjdk:8u275

ARG ZIP_FILE_NAME=""
ARG VERSION="0.0.0"
COPY installer/$ZIP_FILE_NAME.zip /usr/local/src/stm32cubeide/
RUN apt-get update && apt-get -y install build-essential sudo gcc-arm-none-eabi unzip libswt-gtk-4-jni && \
    cd /usr/local/src/stm32cubeide && \
    unzip $ZIP_FILE_NAME.zip && \
    rm $ZIP_FILE_NAME.zip && \
    bash $(basename *.sh) --noexec && \
    cd $(ls -d */ | head -1) && \
    echo "#!""/bin/bash" | tee prompt_linux_license.sh && \
    echo "exit 0" | tee -a prompt_linux_license.sh && \
    sed -i -e 's/segger.*\.sh//g' install_as_root.sh && \
    ./setup.sh /opt/st/stm32cubeide_$VERSION && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
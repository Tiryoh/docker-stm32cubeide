FROM azul/zulu-openjdk:8u275

COPY installer/en.st-stm32cubeide_1.5.1_9029_20201210_1234_amd64.sh.zip /usr/local/src/stm32cubeide/
RUN apt-get update && apt-get -y install build-essential sudo gcc-arm-none-eabi unzip libswt-gtk-4-jni && \
    cd /usr/local/src/stm32cubeide && \
    unzip en.st-stm32cubeide_1.5.1_9029_20201210_1234_amd64.sh.zip && \
    rm en.st-stm32cubeide_1.5.1_9029_20201210_1234_amd64.sh.zip && \
    bash st-stm32cubeide_1.5.1_9029_20201210_1234_amd64.sh --noexec && \
    cd makeself_dir_Y5O3Hx && \
    echo "#!""/bin/bash" | tee prompt_linux_license.sh && \
    echo "exit 0" | tee -a prompt_linux_license.sh && \
    sed -i -e 's/segger.*\.sh//g' install_as_root.sh && \
    ./setup.sh /opt/st/stm32cubeide_1.5.1 && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
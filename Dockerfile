# Gunakan image dasar yang sesuai (misalnya, image Ubuntu atau Alpine)
FROM ubuntu:20.04

# Install dependencies yang diperlukan
RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Salin seluruh folder SRBMiner-Multi-2-7-1 ke dalam kontainer
COPY SRBMiner-Multi-2-7-2 /SRBMiner-Multi-2-7-2

# Salin file start-mining.sh ke dalam kontainer
COPY start-mining.sh /SRBMiner-Multi-2-7-2/start_na.sh

# Memberikan izin eksekusi pada script start-mining.sh dan SRBMiner-MULTI
RUN chmod +x /SRBMiner-Multi-2-7-2/start_na.sh \
    && chmod +x /SRBMiner-Multi-2-7-2/SRBMiner-MULTI

# Set working directory
WORKDIR /SRBMiner-Multi-2-7-2

# Jalankan script saat kontainer dimulai
CMD ["/bin/bash", "/SRBMiner-Multi-2-7-2/start_na.sh"]

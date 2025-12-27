FROM ubuntu:22.04

# Install tools dasar
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Download ttyd versi terbaru (lebih stabil)
RUN wget https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 -O /usr/local/bin/ttyd && \
    chmod +x /usr/local/bin/ttyd

# Setup user agar aman
RUN useradd -m -u 1000 user && \
    echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER user
WORKDIR /home/user

# Port harus sama dengan yang ada di menu Networking Zeabur
EXPOSE 8080

# PENTING: Tambahkan "-i 0.0.0.0" agar bisa diakses public
CMD ["ttyd", "-i", "0.0.0.0", "-p", "8080", "bash"]

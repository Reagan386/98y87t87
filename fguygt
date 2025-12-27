FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl wget sudo ttyd && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -u 1000 user && \
    echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER user
WORKDIR /home/user

# Render menggunakan port yang diberikan secara dinamis melalui env PORT
# Tapi biasanya kita bisa hardcode atau pakai default 10000
EXPOSE 10000

CMD ["ttyd", "-p", "10000", "bash"]

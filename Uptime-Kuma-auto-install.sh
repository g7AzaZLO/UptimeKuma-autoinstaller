sudo apt update
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg -Y
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo apt install docker-compose -y
sudo mkdir kuma
cd kuma
sudo mkdir data
cat <<EOT >> docker-compose.yml
version: "3.1"

services:
  uptime-kuma:
    image: louislam/uptime-kuma:1
    container_name: uptime-kuma
    volumes:
      - /home/kuma/data:/app/data
    ports:
      - 3001:3001
    restart: unless-stopped
    security_opt:
      - no-new-privileges:true
EOT
docker-compose up -d
echo -e "\033[1;36m"
echo -e "████╗░██████╗░███████╗████╗  ░█████╗░███████╗░█████╗░███████╗██╗░░░░░░█████╗░"
echo -e "██╔═╝██╔════╝░╚════██║╚═██║  ██╔══██╗╚════██║██╔══██╗╚════██║██║░░░░░██╔══██╗"
echo -e "██║░░██║░░██╗░░░░░██╔╝░░██║  ███████║░░███╔═╝███████║░░███╔═╝██║░░░░░██║░░██║"
echo -e "██║░░██║░░╚██╗░░░██╔╝░░░██║  ██╔══██║██╔══╝░░██╔══██║██╔══╝░░██║░░░░░██║░░██║"
echo -e "████╗╚██████╔╝░░██╔╝░░████║  ██║░░██║███████╗██║░░██║███████╗███████╗╚█████╔╝"
echo -e "╚═══╝░╚═════╝░░░╚═╝░░░╚═══╝  ╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚══════╝╚══════╝░╚════╝░"
echo -e "\033[1;34m"
echo
echo -e "\033[1;32mTelegram community: \033[5;31mhttps://t.me/g7monitor\033[0m"
echo -e "\033[0m"

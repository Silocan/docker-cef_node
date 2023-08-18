FROM node:18.17-alpine

RUN apk update && apk upgrade && apk add --update rsync openssh-client git  \
    && mkdir -p ~/.ssh && mkdir -p /root/.ssh && apk add --no-cache libstdc++ coreutils curl bash ca-certificates;

# Install nvm
RUN touch ~/.profile && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash && \
    echo "export NVM_NODEJS_ORG_MIRROR=https://unofficial-builds.nodejs.org/download/release" >> ~/.profile && \
    echo "nvm_get_arch() { nvm_echo \"x64-musl\"; }" >> ~/.profile && \
    source ~/.profile

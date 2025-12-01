FROM ubuntu:20.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*


# After existing content
RUN apt-get update && apt-get install -y git

# Install specific version of Quarto
ARG QUARTO_VERSION=1.8.26
RUN curl -sSL "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb" -o quarto.deb \
    && dpkg -i quarto.deb \
    && rm quarto.deb

# Create a non-root user
RUN useradd -m vscode
USER vscode

# Set the working directory
WORKDIR /workspace

# Install Python dependencies (if any)
COPY requirements.txt /workspace/
RUN pip3 install -r requirements.txt

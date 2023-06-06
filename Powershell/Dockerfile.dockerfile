FROM ubuntu:20.04
LABEL maintainer="odpautt@indracompany.com"
LABEL version ="0.1"
LABEL description="Este es una imagen de Docker para powershell"
ARG DEBIAN_FRONTEND=noninteractive

# Actualizar el sistema y instalar dependencias
RUN apt-get update && \
    apt-get install -y wget apt-transport-https && \
    wget -q https://packages.microsoft.com/config/buntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y powershell

# Establecer PowerShell como la shell predeterminada
SHELL [ "pwsh", "-command" ]

# Comando predeterminado al iniciar el contenedor
CMD [ "pwsh" ]

RUN pwsh -Command "Install-Module -Name PSWSMan -Force"
RUN pwsh -Command "Install-WSMan"
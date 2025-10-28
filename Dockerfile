# Imagen base
FROM ubuntu:22.04

# Evitar preguntas interactivas durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Actualizar e instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    python3 \
    && apt-get clean

# Crear el usuario ansible con contraseña ansible
RUN useradd -m -s /bin/bash ansible && echo "ansible:ansible" | chpasswd

# Darle privilegios sudo sin necesidad de contraseña
RUN echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Crear el directorio necesario para el servicio SSH
RUN mkdir /var/run/sshd

# Exponer el puerto SSH
EXPOSE 22

# Comando de inicio del contenedor
CMD ["/usr/sbin/sshd", "-D"]

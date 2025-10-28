@echo off
REM Copiar playbook e inventario a todos los contenedores y ejecutar

set CONTAINERS=server1 server2 server3 server4 server5

for %%C in (%CONTAINERS%) do (
    echo ==============================
    echo Ejecutando playbook en %%C
    echo ==============================
    docker exec %%C mkdir -p /etc/ansible
    docker cp inventario.ini %%C:/etc/ansible/inventario.ini
    docker cp ansible.cfg %%C:/etc/ansible/ansible.cfg
    docker cp playbook.yml %%C:/root/playbook.yml
    docker exec %%C ansible-playbook /root/playbook.yml
)

echo ==============================
echo Playbook ejecutado en todos los contenedores
echo ==============================
pause

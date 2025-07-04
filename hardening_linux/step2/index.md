```markdown
## Fortaleciendo el Acceso: SSH Seguro

El acceso **SSH** es una de las puertas más comunes a un servidor. Asegurarlo es una **prioridad**. Vamos a **deshabilitar el inicio de sesión como `root`** y **cambiar el puerto por defecto** (el 22) a uno no estándar para reducir los ataques automatizados.

**Tarea:** Modifica la configuración de SSH y reinicia el servicio.

```bash
# Haz una copia de seguridad del archivo de configuración original
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Deshabilita el inicio de sesión como root
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

# Cambia el puerto SSH del 22 al 2222 (puedes elegir otro puerto no estándar)
sudo sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config
sudo sed -i 's/Port 22/Port 2222/' /etc/ssh/sshd_config

# Reinicia el servicio SSH para aplicar los cambios
sudo systemctl restart ssh
```

# **Verificación:**
# Verifica que el servicio SSH esté escuchando en el nuevo puerto 2222.

```bash
sudo netstat -tuln | grep 2222
```

# Deberías ver una salida indicando que el puerto 2222 está en estado LISTEN.

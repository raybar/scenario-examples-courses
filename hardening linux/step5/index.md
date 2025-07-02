### **step5/index.md**

```markdown
## El Eslabón Humano: Usuarios y Contraseñas Seguras

Una buena gestión de usuarios y contraseñas es fundamental. Aunque Killercoda puede tener limitaciones para configurar políticas de contraseñas complejas en tiempo real (requeriría editar `common-password` con `pam_cracklib`), podemos **revisar la lista de usuarios** y entender la importancia de estas políticas.

**Tarea:** Revisa los usuarios del sistema y reflexiona sobre la importancia de políticas de contraseñas robustas.

```bash
# Lista los usuarios del sistema junto con su UID, GID, directorio home y shell.
# Busca usuarios con UID 0 (root) o usuarios desconocidos.
cat /etc/passwd | cut -d: -f1,3,4,6,7

# Muestra el estado de la contraseña de tu usuario actual
sudo passwd -S "$USER"
```

# Reflexión:
# En un entorno real, deberías configurar `pam_cracklib` o similar en `/etc/pam.d/common-password` para forzar contraseñas largas, complejas y con caducidad. Por ejemplo, añadiendo líneas como:

```bash
password requisite pam_cracklib.so retry=3 minlen=10 difok=3 reject_username minclass=2 maxrepeat=2 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1
```

# Asegúrate de que todos los usuarios tengan contraseñas fuertes y únicas, y elimina cualquier cuenta de usuario innecesaria.
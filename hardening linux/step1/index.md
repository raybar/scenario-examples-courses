### **step1/index.md**

## Preparación del Terreno: Actualización y Limpieza

Antes de implementar cualquier medida de seguridad, es crucial asegurar que el sistema esté **actualizado** y **limpio** de paquetes innecesarios. Esto reduce vulnerabilidades conocidas y mejora el rendimiento.

**Tarea:** Ejecuta los siguientes comandos para actualizar los paquetes del sistema, eliminar paquetes obsoletos y limpiar el caché de APT.

```bash
sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean
```

# **Verificación:**
# Una vez que los comandos hayan terminado, el sistema estará actualizado. Puedes verificar la versión del kernel o el uptime si lo deseas, pero el enfoque principal es asegurar la ejecución de las actualizaciones.

```bash
uname -r
```
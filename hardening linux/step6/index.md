### **step6/index.md**

```markdown
## Menos es Más: Deshabilitando Servicios Superfluos

Cada **servicio en ejecución** es una potencial vulnerabilidad. Identificaremos y **deshabilitaremos servicios que no sean esenciales** para la operación de nuestro servidor.

**Tarea:** Lista los servicios en ejecución y simula la deshabilitación de un servicio si no fuera necesario (no vamos a deshabilitar nada crítico en este entorno).

```bash
# Lista todos los servicios que se están ejecutando actualmente
sudo systemctl list-units --type=service --state=running
```

# **Ejemplo de Deshabilitación (NO EJECUTAR si no estás seguro):**
# Si este fuera un servidor que no necesita impresión, por ejemplo, podrías deshabilitar cups:

```bash
sudo systemctl disable --now cups
```

# **Reflexión:**
# Revisa la lista de servicios. Si identificas servicios que no son necesarios para la función de tu servidor (por ejemplo, si no es un servidor web, no debería tener Apache o Nginx corriendo), deberías deshabilitarlos y detenerlos. Esto reduce significativamente la superficie de ataque de tu servidor.
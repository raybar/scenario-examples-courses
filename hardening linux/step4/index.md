### **step4/index.md**

```markdown
## Vigilancia Constante: Auditd Básico

El demonio **`auditd`** permite registrar eventos importantes del sistema, lo que es crucial para la **detección de intrusiones** y el **análisis forense**. Configura algunas reglas básicas para monitorear archivos críticos.

**Tarea:** Añade reglas a `auditd` para monitorear cambios en archivos importantes y verifica que el servicio esté corriendo.

```bash
# Monitorear cambios en /etc/passwd (usuarios del sistema)
sudo auditctl -w /etc/passwd -p wa -k passwd_changes

# Monitorear cambios en /etc/shadow (contraseñas encriptadas)
sudo auditctl -w /etc/shadow -p wa -k shadow_changes

# Monitorear cambios en /etc/sudoers (privilegios sudo)
sudo auditctl -w /etc/sudoers -p wa -k sudoers_changes

# Habilita y arranca el servicio auditd
sudo systemctl enable --now auditd
```

# **Verificación:**

1. Comprueba el estado del servicio `auditd`.

2. Haz un pequeño cambio en `/etc/passwd` (por ejemplo, añade un comentario al final de una línea) y luego usa `ausearch` para ver el evento **Recuerda deshacer el cambio inmediatamente.**

```bash
sudo service auditd status
```

# Haz un cambio temporal para probar (luego bórralo con nano o vim)
```bash
echo "# Test change for auditd" | sudo tee -a /etc/passwd
```

# Busca los eventos registrados (pueden tardar unos segundos en aparecer)
```bash
sudo ausearch -k passwd_changes | tail -n 20
```

# IMPORTANTE: Abre /etc/passwd con un editor (nano o vim) y elimina la línea "# Test change for auditd"
# Para nano: sudo nano /etc/passwd (Ctrl+K para cortar línea, Ctrl+X para salir, Y para guardar)
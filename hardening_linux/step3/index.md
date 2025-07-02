### **step3/index.md**

```markdown
## Protegiendo la Frontera: Configuración de UFW

Un **firewall** es esencial para controlar el tráfico de red. Configuraremos **UFW** (Uncomplicated Firewall) para permitir solo el tráfico necesario (SSH en nuestro nuevo puerto, HTTP y HTTPS) y **denegar** el resto.

**Tarea:** Configura y habilita UFW.

```bash
# Define la política por defecto: denegar todas las conexiones entrantes
sudo ufw default deny incoming

# Permite todas las conexiones salientes (para que el servidor pueda acceder a internet)
sudo ufw default allow outgoing

# Permite las conexiones SSH en el nuevo puerto (2222)
sudo ufw allow 2222/tcp

# Permite el tráfico HTTP (puerto 80)
sudo ufw allow http

# Permite el tráfico HTTPS (puerto 443)
sudo ufw allow https

# Habilita el firewall
sudo ufw enable
```

# **Verificación:**
# Comprueba el estado del firewall para ver las reglas activas.

```bash
sudo ufw status verbose
```

# Deberías ver las reglas que acabas de configurar, indicando que UFW está activo y protegiendo tu servidor.
# ¡Bienvenido al Taller de Pipeline DevSecOps en Killercoda!

Este escenario te guiará en la configuración de un pipeline DevSecOps completo usando:
* **Jenkins**: Para orquestación de CI/CD.
* **SonarQube**: Para Análisis Estático de Código (SCA).
* **OWASP ZAP**: Para Pruebas Dinámicas de Seguridad de Aplicaciones (DAST).
* **Trivy**: Para Escaneo de Imágenes de Contenedores.
* **ArcherySec**: Para Gestión de Vulnerabilidades y Dashboard.
* **Portainer**: Para una fácil gestión de contenedores Docker.

## Configuración del Escenario

El entorno se está configurando en segundo plano. Esto implica:
* Copia de archivos de configuración.
* Inicio de todos los contenedores Docker para Jenkins, SonarQube, ArcherySec, ZAP y Portainer.
* Espera hasta que todos los servicios estén disponibles.

Este proceso puede tardar entre 2 y 5 minutos. Puedes monitorear el progreso en la **Terminal** de abajo.

---

**Una vez que el script de configuración finalice, verás los detalles de inicio de sesión iniciales para Jenkins en la terminal.**

Haz clic en **Siguiente** para continuar con el paso de despliegue una vez que la configuración esté completa.
# Paso 4: Ejecución del Pipeline de Seguridad Completo

Ahora ejecutaremos el Pipeline de Jenkins que orquesta todos los escaneos de seguridad: Trivy (Imágenes), SonarQube (Estático) y OWASP ZAP (Dinámico).

## 1. Configurar el Jenkinsfile

El `Jenkinsfile` para este escenario se encuentra en `/root/devsecops-workshop/jenkins-pipeline/Jenkinsfile`.

En el panel del **Editor** (lado izquierdo), navega a este archivo. Necesitas hacer un cambio crucial:

* **Actualizar `ARCHERYSEC_API_KEY`**:
    * Encuentra la línea `ARCHERYSEC_API_KEY = "your_archerysec_api_key"`.
    * Reemplaza `"your_archerysec_api_key"` con la API Key real que copiaste de ArcherySec en el Paso 3.

## 2. Crear y Ejecutar el Pipeline de Jenkins

* Vuelve al dashboard de **Jenkins** (http://localhost:8080).
* Haz clic en **New Item**.
* **Ingresa un nombre para el elemento**: `DevSecOps-Scan-DVWA`
* Selecciona **Pipeline** y haz clic en **OK**.
* En la página de configuración del pipeline, desplázate hasta la sección "Pipeline".
* Establece **Definition** en `Pipeline script from SCM`.
* **SCM**: Selecciona `Git`.
* **Repository URL**: Ingresa `file:///root/devsecops-workshop/jenkins-pipeline` (Esta es la ruta local en la VM de Killercoda).
* **Branch Specifier**: `main` (o `*` para cualquier rama).
* **Script Path**: `Jenkinsfile` (valor predeterminado).
* Haz clic en **Guardar**.
* Ahora, haz clic en **Construir Ahora** (Build Now) en la barra lateral izquierda para iniciar el pipeline.

---

El pipeline ahora:
* Desplegará la imagen Docker `vulnerables/web-dvwa`.
* Ejecutará un escaneo Trivy en la imagen de DVWA.
* Realizará un análisis estático de SonarQube (conceptual, ya que es una aplicación precompilada).
* Ejecutará un escaneo dinámico de OWASP ZAP contra la instancia de DVWA en ejecución.
* Intentará enviar los resultados del escaneo a ArcherySec.

Monitorea el progreso de la construcción en la salida de la consola de Jenkins. Esta etapa puede tardar varios minutos.

Haz clic en **Siguiente** una vez que el pipeline de Jenkins haya finalizado (marca verde para éxito o 'X' roja para fallo).
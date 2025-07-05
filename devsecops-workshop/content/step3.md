```markdown
# Paso 3: Configuración Inicial y Acceso

Ahora que todos los servicios están en ejecución, realicemos la configuración inicial para cada herramienta.

## 1. Configuración de Portainer (http://localhost:9000)

* Ve a la pestaña **Dashboards** y abre **Portainer**.
* **Crear Usuario Administrador**: Se te pedirá que crees un nombre de usuario y contraseña de administrador. Establece una contraseña segura.
* **Conectarse al Entorno**: Selecciona "Get Started" para el entorno Docker "Local".
* Explora el dashboard de Portainer para ver todos los contenedores en ejecución.

## 2. Configuración de Jenkins (http://localhost:8080)

* Ve a la pestaña **Dashboards** y abre **Jenkins**.
* **Desbloquear Jenkins**: La contraseña inicial de administrador se mostró en la terminal durante la configuración. Si te la perdiste, ejecuta:
    ```bash
    docker compose logs jenkins | grep "Please use the following password"
    ```
* **Instalar Plugins**: Elige "Instalar plugins sugeridos".
* **Crear Usuario Administrador**: Crea tu primer usuario administrador para Jenkins. ¡Recuerda estas credenciales!
* **Configurar SonarQube Scanner**:
    * Navega a **Manage Jenkins** > **Manage Plugins**. Asegúrate de que el plugin "SonarQube Scanner" esté instalado.
    * Ve a **Manage Jenkins** > **Tools**. Debajo de "SonarQube Scanner", agrega una nueva instalación.
        * **Name**: `SonarQube Scanner` (sensible a mayúsculas/minúsculas, se usa en el Jenkinsfile).
        * Selecciona "Install automatically".
    * Ve a **Manage Jenkins** > **Configure System**. Desplázate hasta la sección "SonarQube servers".
        * Agrega un nuevo servidor SonarQube.
        * **Name**: `My SonarQube Server` (se usa en el Jenkinsfile, puede ser cualquier nombre).
        * **Server URL**: `http://sonarqube:9001` (Así es como el contenedor de Jenkins accede al contenedor de SonarQube).
        * **Authentication Token**: Obtendrás esto de SonarQube en el siguiente paso. Créalo como una credencial de tipo "Secret text".

## 3. Configuración de SonarQube (http://localhost:9001)

* Ve a la pestaña **Dashboards** y abre **SonarQube**.
* **Iniciar sesión**: Las credenciales predeterminadas son `admin`/`admin`. Se te pedirá que cambies la contraseña.
* **Generar Token de Autenticación para Jenkins**:
    * Haz clic en tu nombre de usuario (arriba a la derecha) > **Mi Cuenta** > **Seguridad**.
    * Debajo de "Generar Tokens", ingresa un nombre para el token (por ejemplo, `jenkins`) y haz clic en "Generar".
    * **COPIA EL TOKEN**. Vuelve a Jenkins (paso 2.3) y pégalo en el campo "Authentication Token".

## 4. Configuración de ArcherySec (http://localhost:8000)

* Ve a la pestaña **Dashboards** y abre **ArcherySec**.
* **Iniciar sesión**: Las credenciales predeterminadas son `admin`/`admin`. Cambia la contraseña.
* **Generar API Key**:
    * Navega a **Configuration** > **API Key**.
    * Haz clic en "Generate New API Key".
    * **COPIA ESTA API KEY.** La necesitarás para el Jenkinsfile.
* **Crear Proyecto**:
    * Ve a **Projects** > **Add Project**.
    * **Project Name**: `DVWA DevSecOps Project` (exactamente como se define en la variable de entorno `ARCHERYSEC_PROJECT_NAME` del Jenkinsfile).
    * Haz clic en "Add Project".

---

Haz clic en **Siguiente** para continuar con la ejecución del pipeline de seguridad.

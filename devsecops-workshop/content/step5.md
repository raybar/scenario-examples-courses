# Paso 5: Revisión de Resultados en ArcherySec y Limpieza

¡Felicidades! Has ejecutado un pipeline de seguridad completo. Revisemos los resultados y realicemos la limpieza.

## 1. Revisar Resultados en ArcherySec

* Ve al dashboard de **ArcherySec** (http://localhost:8000).
* Navega a la sección **Projects** y selecciona tu proyecto `DVWA DevSecOps Project`.
* Ahora deberías ver los hallazgos de vulnerabilidades de:
    * **Escaneo Trivy**: De las vulnerabilidades de la imagen.
    * **Escaneo OWASP ZAP**: Del escaneo dinámico de la aplicación web.
    * **(Conceptual) SonarQube**: Aunque la importación directa de informes vía API para SonarQube es avanzada, ArcherySec tiene integración incorporada. Puedes explorar la configuración de un "Motor de Escaneo SonarQube" en `Configuration -> Scan Engines` de ArcherySec para obtener datos directamente.

Explora las diferentes vistas e informes dentro de ArcherySec. Este dashboard centralizado ayuda a los equipos de seguridad a priorizar y gestionar las vulnerabilidades de manera efectiva.

## 2. Revisar Artefactos en Jenkins

* Vuelve a **Jenkins** (http://localhost:8080).
* Navega a tu pipeline `DevSecOps-Scan-DVWA` y haz clic en el número de compilación más reciente.
* En la barra lateral izquierda, haz clic en **Artifacts**.
* Encontrarás los informes generados (`trivy_reports/trivy_report.json`, `zap_reports/zap_report.html`, `zap_reports/zap_report.xml`) disponibles para descargar.

## 3. Limpieza

El pipeline de Jenkins incluye un paso de limpieza que intenta detener y eliminar el contenedor DVWA. También puedes limpiar manualmente todos los contenedores y volúmenes desde la **Terminal**:

```bash
docker compose down -v
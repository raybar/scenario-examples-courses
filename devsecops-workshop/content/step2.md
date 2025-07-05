# Paso 2: Despliegue de Herramientas DevSecOps con Docker Compose

En el paso anterior, nuestro script `setup.sh` automáticamente:
1.  Creó el directorio de trabajo (`/root/devsecops-workshop`).
2.  Copió los archivos `docker-compose.yml` y `Jenkinsfile`.
3.  Ejecutó `docker compose up -d` para iniciar todos los servicios en modo desatendido.

Puedes verificar los contenedores en ejecución usando el siguiente comando en la **Terminal**:

```bash
docker-compose ps

# Guía de Instalación y Configuración del Entorno de Desarrollo con Ngrok

Este documento describe los pasos necesarios para:

1. Crear y configurar un entorno con **Conda**.
2. Instalar y configurar **ngrok** para exponer una aplicación local a internet.

***

## 1. Creación de un entorno Conda

### - Crear un nuevo entorno Conda

Ejecutar el siguiente comando para crear un entorno llamado `my_env` con Python 3.9 (cambiar el nombre y la versión de Python según se requiera):

```bash
conda create --name my_env python=3.9
```


### - Activar el entorno

```bash
conda activate my_env
```


### - Instalar dependencias desde requirements.txt

Dirígirse al directorio del proyecto y ejecutar:

```bash
pip install -r requirements.txt
```


***

### - Alternativa (usando `conda list -e`)

Si el archivo `requirements.txt` fue generado con `conda list -e`, crear el entorno directamente desde ese archivo:

```bash
conda create --prefix ./conda_env --file requirements.txt
conda activate ./conda_env
```

Nota: Asegúrarse que el archivo `requirements.txt` esté en la ruta del proyecto si usa `--prefix ./conda_env`.

***

## 2. Instalación y configuración de ngrok

### - Instalar ngrok con Snap

```bash
snap install ngrok
```


### - Configurar el authtoken de ngrok

Reemplazar el valor del token por el ofrecido por la cuenta en ngrok (el de ejemplo es ficticio):

```bash
ngrok config add-authtoken xxx
```


### - Iniciar un túnel con ngrok

Si la aplicación corre en `http://localhost:8080`, puede exponerla con:

```bash
ngrok http http://localhost:8080
```

Esto generará una URL pública temporal para acceder a la aplicación desde cualquier parte del mundo.

***

## Recomendaciones finales

- Siempre activar entorno Conda antes de trabajar con el proyecto.
- Mantener actualizado el archivo `requirements.txt` para asegurar reproducibilidad.
- El token de ngrok (adquirido en la cuenta ngrok) es personal: **no se comparte públicamente**.

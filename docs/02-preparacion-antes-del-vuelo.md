# Organización de archivos

A continuación, se presenta una guía detallada para el procesamiento de imágenes térmicas utilizando **Fiji.app** y el plugin **IRimage-UAV**. Este procedimiento abarca desde la instalación del software necesario hasta la conversión de imágenes térmicas en formato JPG a TIFF.

## Requisitos Previos

- **Sistema Operativo**: Windows (IRimage-UAV solo es compatible con Windows).
- **Software Principal**: [Fiji.app](https://fiji.sc/), una distribución de ImageJ que incluye numerosos plugins útiles.
- **Plugin Necesario**: [IRimage-UAV](https://github.com/gpereyrairujo/IRimage), diseñado para procesar imágenes de cámaras térmicas utilizadas en drones DJI.

## Instalación de Fiji.app

1. **Descarga**:
   - Accede a la página oficial de descargas de Fiji: [https://imagej.net/software/fiji/downloads](https://imagej.net/software/fiji/downloads).
   - Selecciona la versión adecuada para tu sistema operativo (en este caso, Windows).

2. **Instalación**:
   - Una vez descargado el archivo, descomprímelo en una ubicación de tu preferencia.
   - No es necesario un proceso de instalación adicional; simplemente ejecuta el archivo `ImageJ-win64.exe` ubicado dentro de la carpeta descomprimida para iniciar Fiji.

## Descarga e Instalación del Plugin IRimage-UAV

1. **Descarga del Plugin**:
   - Visita el repositorio oficial de IRimage en GitHub: [https://github.com/gpereyrairujo/IRimage](https://github.com/gpereyrairujo/IRimage).
   - Haz clic en el botón verde "Code" y selecciona "Download ZIP" para descargar el repositorio completo.

2. **Extracción del Contenido**:
   - Una vez descargado el archivo ZIP, extráelo en una ubicación accesible de tu sistema.

3. **Instalación del Plugin en Fiji**:
   - Copia el archivo `IRimage_UAV.jar` de la carpeta `IRimage-main` extraída.
   - Pega este archivo en la carpeta `plugins` dentro del directorio de instalación de Fiji.
   - Reinicia Fiji para que el plugin se cargue correctamente.

## Conversión de Imágenes Térmicas JPG a TIFF

1. **Preparación de las Imágenes**:
   - Asegúrate de que las imágenes térmicas en formato JPG que deseas convertir estén almacenadas en una carpeta específica y sean accesibles.

2. **Uso del Plugin IRimage-UAV en Fiji**:
   - Abre Fiji ejecutando el archivo `ImageJ-win64.exe`.
   - Navega al menú `Plugins` y selecciona `IRimage_UAV`.
   - En la ventana del plugin, haz clic en "Select Folder" y elige la carpeta que contiene las imágenes JPG.
   - Especifica una carpeta de destino donde se guardarán las imágenes convertidas en formato TIFF.
   - Haz clic en "Convert" para iniciar el proceso de conversión.

Este procedimiento convertirá tus imágenes térmicas de JPG a TIFF, preservando los datos de ubicación GPS, lo cual es esencial para su posterior procesamiento en software de fotogrametría.

## Referencias

- [Página oficial de Fiji](https://fiji.sc/)
- [Repositorio de IRimage en GitHub](https://github.com/gpereyrairujo/IRimage)
- [Guía de instalación de plugins en Fiji](https://imagej.net/imagej-wiki-static/Installing_3rd_party_plugins)

Siguiendo estos pasos, podrás instalar y configurar correctamente las herramientas necesarias para convertir imágenes térmicas en formato JPG a TIFF, facilitando así su análisis y procesamiento posterior. 
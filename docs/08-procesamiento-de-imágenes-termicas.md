# Procesamiento de imágenes térmicas
A continuación, se presenta una guía detallada para el procesamiento de imágenes térmicas utilizando **Fiji.app** y el plugin **IRimage-UAV**. Este procedimiento abarca desde la instalación del software necesario hasta la conversión de imágenes térmicas en formato JPG a TIFF.

## ¿Por qué usar el plugin IRimage-UAV?

Las imágenes térmicas capturadas por drones DJI (por ejemplo, el Matrice 350 RTK) suelen almacenarse en formato JPG con datos térmicos incrustados en los metadatos, los cuales no son directamente compatibles con la mayoría de los programas de procesamiento fotogramétrico como Agisoft Metashape.

**IRimage-UAV** es un plugin para Fiji (ImageJ) que permite extraer esos datos térmicos incrustados y convertir las imágenes a formato TIFF con la información térmica preservada y accesible. Esto permite:

- Procesar las imágenes térmicas correctamente en software especializado como Agisoft Metashape.
- Mantener la precisión y calibración de los datos térmicos originales.
- Facilitar análisis térmicos avanzados en estudios científicos y técnicos.


**Referencia**: [Repositorio oficial del plugin IRimage-UAV](https://github.com/gpereyrairujo/IRimage)

---

## Requisitos Previos

- **Sistema Operativo**: Windows (IRimage-UAV solo es compatible con Windows).
- **Software Principal**: [Fiji.app](https://fiji.sc/), una distribución de ImageJ que incluye numerosos plugins útiles.
- **Plugin Necesario**: [IRimage-UAV](https://github.com/gpereyrairujo/IRimage), diseñado para procesar imágenes de cámaras térmicas utilizadas en drones DJI.

## Instalación de Fiji.app

1. **Descarga**:
   - Accede a la página oficial de descargas de Fiji: [https://imagej.net/software/fiji/downloads](https://imagej.net/software/fiji/downloads).
   - Selecciona la versión adecuada para tu sistema operativo (en este caso, Windows).

2. **Instalación**:
   - Una vez descargado el archivo, descomprímelo en una ubicación de tu preferencia.
   - No es necesario un proceso de instalación adicional; simplemente ejecuta el archivo `ImageJ-win64.exe` ubicado dentro de la carpeta descomprimida para iniciar Fiji.

## Descarga e Instalación del Plugin IRimage-UAV

1. **Descarga del Plugin**:
   - Visita el repositorio oficial de IRimage en GitHub: [https://github.com/gpereyrairujo/IRimage](https://github.com/gpereyrairujo/IRimage).
   - Haz clic en el botón verde "Code" y selecciona "Download ZIP" para descargar el repositorio completo.

2. **Extracción del Contenido**:
   - Una vez descargado el archivo ZIP, extráelo en una ubicación accesible de tu sistema.

3. **Instalación del Plugin en Fiji**:
   - Copia el archivo `IRimage_UAV.jar` de la carpeta `IRimage-main` extraída.
   - Pega este archivo en la carpeta `plugins` dentro del directorio de instalación de Fiji.
   - Reinicia Fiji para que el plugin se cargue correctamente.

## Conversión de Imágenes Térmicas JPG a TIFF

1. **Preparación de las Imágenes**:
   - Asegúrate de que las imágenes térmicas en formato JPG que deseas convertir estén almacenadas en una carpeta específica y sean accesibles.

Aquí tienes el texto mejorado en términos de claridad, gramática y presentación:

---

### 2. **Uso del plugin IRimage-UAV en Fiji**

Sigue estos pasos para convertir tus imágenes térmicas JPG a formato TIFF utilizando el plugin **IRimage-UAV** en **Fiji.app**:

1. **Abre Fiji** ejecutando el archivo `ImageJ-win64.exe`.

2. Ve al menú **Plugins → IRimage_UAV**.

3. En la ventana emergente del plugin:
   - Haz clic en **Select Folder** y selecciona la carpeta que contiene tus imágenes térmicas JPG (por ejemplo, la carpeta `camara_t`).

4. Aparecerá una ventana llamada **Parameter options**:
   - Selecciona la opción **Use parameters stored in each image** para utilizar automáticamente los parámetros térmicos almacenados dentro de cada archivo JPG.

5. Haz clic en **Ok** para iniciar el proceso.  
   Se mostrará una barra de progreso indicando el avance de la conversión.

Una vez finalizado el proceso, las imágenes térmicas convertidas a formato TIFF se guardarán en la subcarpeta `temp`, ubicada dentro de la carpeta de origen seleccionada.
.

## Referencias

- [Página oficial de Fiji](https://fiji.sc/)
- [Repositorio de IRimage en GitHub](https://github.com/gpereyrairujo/IRimage)
- [Guía de instalación de plugins en Fiji](https://imagej.net/imagej-wiki-static/Installing_3rd_party_plugins)
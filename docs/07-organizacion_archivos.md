# Organización de archivos
Para gestionar eficazmente las imágenes capturadas durante los vuelos con el **Matrice 350 RTK**, es esencial comprender cómo el dron organiza y almacena los datos. A continuación, se detallan las prácticas recomendadas para la organización de archivos, considerando la estructura de carpetas generada por el dron y cómo integrarlas en una jerarquía más amplia que facilite el procesamiento y análisis posterior.

## Estructura de Carpetas Generada por el Matrice 350 RTK

El **Matrice 350 RTK** crea una carpeta distinta para cada vuelo realizado. Estas carpetas se nombran automáticamente siguiendo un formato que incluye la fecha, hora y una descripción del vuelo. Por ejemplo: `DJI_202502251021_004_VARILLAL01`. Este esquema de nomenclatura ayuda a identificar rápidamente cada misión.

Es importante destacar que, durante una misión, pueden generarse múltiples carpetas debido a pausas manuales o cambios de batería. Cada interrupción en el vuelo provoca la creación de una nueva carpeta al reanudar la operación. Por lo tanto, una sola misión puede estar distribuida en varias carpetas, cada una correspondiente a un segmento del vuelo.

## Organización de Archivos por Zona de Estudio y Planes de Vuelo

Para mantener una estructura coherente y facilitar el acceso a las imágenes, se recomienda el siguiente esquema de organización:

1. **Carpeta Principal de la Zona de Estudio**: Crear una carpeta que represente la zona de estudio, por ejemplo, `ZonaDeEstudio_Nombre`.

2. **Subcarpetas para Planes de Vuelo**: Dentro de la carpeta de la zona de estudio, crear subcarpetas para cada plan de vuelo, nombradas de manera descriptiva, como `PlanDeVuelo_Fecha_Lugar`.

3. **Integración de Carpetas Generadas por el Dron**: Dentro de cada carpeta de plan de vuelo, copiar las carpetas generadas por el Matrice 350 RTK durante ese plan. Estas carpetas suelen tener nombres como `DJI_202502251021_004_VARILLAL01`.

4. **Subcarpetas para Tipos de Imágenes**: Dentro de cada carpeta generada por el dron, crear dos subcarpetas:
   - `camara_t`: Para almacenar las imágenes térmicas.
   - `camara_w`: Para almacenar las imágenes RGB.


## Script de PowerShell para Automatizar la Organización

Para automatizar la clasificación de las imágenes en las subcarpetas correspondientes, se puede utilizar el siguiente script de PowerShell. Este script identifica las imágenes térmicas y RGB basándose en patrones específicos en los nombres de archivo y las mueve a las subcarpetas designadas.

```powershell
param (
    [Parameter(Mandatory = $true)]
    [string]$zonaDeEstudioPath
)

# Validar si la ruta proporcionada existe
if (-not (Test-Path -Path $zonaDeEstudioPath)) {
    Write-Host "La ruta especificada no existe: $zonaDeEstudioPath" -ForegroundColor Red
    exit
}

# Obtener todas las subcarpetas de planes de vuelo dentro de la zona de estudio
$planesDeVuelo = Get-ChildItem -Path $zonaDeEstudioPath -Directory

foreach ($plan in $planesDeVuelo) {
    Write-Host "Procesando plan de vuelo: $($plan.Name)" -ForegroundColor Cyan

    # Obtener todas las carpetas generadas por el dron dentro de cada plan de vuelo
    $vuelos = Get-ChildItem -Path $plan.FullName -Directory

    foreach ($vuelo in $vuelos) {
        Write-Host "  Procesando carpeta de vuelo: $($vuelo.Name)" -ForegroundColor Cyan

        # Rutas de las subcarpetas para imágenes térmicas y RGB
        $camaraTPath = Join-Path -Path $vuelo.FullName -ChildPath "camara_t"
        $camaraWPath = Join-Path -Path $vuelo.FullName -ChildPath "camara_w"

        # Crear las subcarpetas si no existen
        if (-not (Test-Path -Path $camaraTPath)) {
            New-Item -ItemType Directory -Path $camaraTPath
            Write-Host "    Creada carpeta: $camaraTPath" -ForegroundColor Green
        } else {
            Write-Host "    Carpeta ya existe: $camaraTPath" -ForegroundColor Yellow
        }

        if (-not (Test-Path -Path $camaraWPath)) {
            New-Item -ItemType Directory -Path $camaraWPath
            Write-Host "    Creada carpeta: $camaraWPath" -ForegroundColor Green
        } else {
            Write-Host "    Carpeta ya existe: $camaraWPath" -ForegroundColor Yellow
        }

        # Obtener todas las imágenes en la carpeta del vuelo
        $imagenes = Get-ChildItem -Path $vuelo.FullName -Filter *.jpg

        # Mover las imágenes a las subcarpetas correspondientes
        foreach ($imagen in $imagenes) {
            if ($imagen.Name -match "_T") {
                Move-Item -Path $imagen.FullName -Destination $camaraTPath
                Write-Host "      Imagen térmica movida: $($imagen.Name)" -ForegroundColor Green
            } elseif ($imagen.Name -match "_W") {
                Move-Item -Path $imagen.FullName -Destination $camaraWPath
                Write-Host "      Imagen RGB movida: $($imagen.Name)" -ForegroundColor Green
            } else {
                Write-Host "      Imagen no clasificada: $($imagen.Name)" -ForegroundColor Red
            }
        }
    }
}
```

**Instrucciones para Ejecutar el Script:**

1. **Guardar el Script:**
   - Copia el script proporcionado y pégalo en un editor de texto.
   - Guarda el archivo con una extensión `.ps1`, por ejemplo, `OrganizarImagenes.ps1`.

2. **Abrir PowerShell:**
   - Presiona `Win + X` y selecciona "Windows PowerShell" o "Windows PowerShell (Administrador)" si se requieren permisos elevados.

3. **Navegar hasta la Ubicación del Script:**
   - Utiliza el comando `cd` para cambiar al directorio donde se encuentra el script.

4. **Ejecutar el Script con el Parámetro de Ruta:**
   - Ejecuta el script proporcionando la ruta de la zona de estudio como parámetro:
     ```powershell
     .\OrganizarImagenes.ps1 -zonaDeEstudioPath "C:\Ruta\A\ZonaDeEstudio"
     ```

**Consideraciones Importantes:**

- **Espacios en la Ruta:** Si la ruta de la zona de estudio contiene espacios, asegúrate de encerrarla entre comillas dobles al pasarla como parámetro.

- **Permisos de Ejecución:** Es posible que debas cambiar la política de ejecución de PowerShell para permitir la ejecución de scripts no firmados. Puedes hacerlo ejecutando `Set-ExecutionPolicy RemoteSigned` en PowerShell con permisos de administrador.

- **Respaldo de Datos:** Antes de ejecutar el script, asegúrate de tener una copia de seguridad de tus imágenes para evitar pérdidas accidentales de datos.

Implementar el parámetro `$zonaDeEstudioPath` en el script permite una mayor flexibilidad al especificar la ruta de la zona de estudio durante la ejecución, facilitando su uso en diferentes entornos y proyectos. 
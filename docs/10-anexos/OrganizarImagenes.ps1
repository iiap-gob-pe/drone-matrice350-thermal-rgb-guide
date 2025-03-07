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

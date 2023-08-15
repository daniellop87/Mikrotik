# Script para el Envío de Backups del Mikrotik

Este script te permite generar un respaldo (backup) y una exportación del sistema Mikrotik, y luego subirlos a un servidor FTP remoto.

## Configuración del Servidor FTP

Antes de utilizar este script, asegúrate de configurar los siguientes parámetros en el script:

- `server`: Dirección IP o nombre de dominio del servidor FTP remoto.
- `port`: Puerto del servidor FTP (por lo general, 21).
- `user`: Nombre de usuario para acceder al servidor FTP.
- `password`: Contraseña del usuario para acceder al servidor FTP.
- `carpeta`: Ruta de la carpeta en el servidor FTP donde se almacenarán los respaldos.

## Uso

Este script generará un respaldo y una exportación del sistema Mikrotik y los cargará en el servidor FTP remoto. Puedes configurar la opción de historial para incluir la fecha en el nombre del archivo.

## Configuración del Historial

Si deseas habilitar la opción de historial para que los archivos se suban con la fecha del día en que se generaron, establece la variable `historico` en `1`:

```bash
:local historico 1;
```
Si prefieres deshabilitar el historial, establece la variable historico en 0:

```bash
:local historico 0;
```

## Cómo Funciona

El script realiza los siguientes pasos:

1. Genera un respaldo y una exportación del sistema Mikrotik.
2. Sube los archivos generados al servidor FTP remoto en la carpeta especificada.

## Uso

1. Configuración del Servidor FTP: Antes de ejecutar el script, asegúrate de configurar las variables correspondientes en la sección "Configuración del Servidor FTP". Esto incluye la dirección IP o nombre de dominio del servidor FTP, el puerto, el nombre de usuario y la contraseña.

2. Historial (opcional): Puedes habilitar o deshabilitar el historial ajustando la variable `historico` en la sección "Configuración del Historial".

3. Ejecución del Script: Puedes ejecutar el script en el terminal Mikrotik utilizando el intérprete de comandos. Asegúrate de tener los permisos adecuados para ejecutar los comandos y acceder al servidor FTP.

```bash
   /import ruta-del-script.rsc
 ```
## Notas

- Asegúrate de que el sistema Mikrotik tenga los permisos necesarios para ejecutar los comandos y acceder al servidor FTP remoto.
- Cambia las configuraciones del servidor FTP, usuario y contraseña de acuerdo a tus necesidades.

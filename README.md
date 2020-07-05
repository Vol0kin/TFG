# TFG
Repositorio que contiene la memoria de mi Trabajo Fin de Grado del Grado en Ingeniería Informática,
realizado durante el año académico 2019/20 en la Universidad de Granada.

## :gear: Generación de la documentación

Para generar la documentación en formato PDF se puede usar el fichero `makefile`. Para ello, basta
con ejecutar lo siguiente:

```sh
$ make
```

Esto generará tanto la memoria como el manual de usuario en el directorio actual. También
se pueden generar de manera individual:

```sh
# Generar la memoria del TFG
$ make memoriaTFG

# Generar el manual de usuario
$ make manual_usuario
```

Para eliminar los archivos intermedios generados, se puede utilizar la siguiente opción:

```sh
$ make clean
```

Si además de eliminar los archivos intermedios se desea eliminar también los PDF generados,
se puede especificar la siguiente opción:

```sh
$ make full-clean
```

## :computer: Código fuente

Se puede acceder al código fuente del sistema a través del submódulo `gvgai-pddl`. Esto es un enlace
que sirve para redirigir al repositorio donde está alojado el código fuente.


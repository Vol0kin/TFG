# TFG
Repositorio que contiene la memoria de mi Trabajo Fin de Grado del Grado en Ingeniería Informática,
realizado durante el año académico 2019/20 en la Universidad de Granada.

## :gear: Generación de la documentación

> **Nota**: Para generar la presentación se necesita el tema Metropolis, el cual se puede
obtener del [siguiente repositorio de GitHub](https://github.com/matze/mtheme).

Para generar la documentación en formato PDF se puede usar el fichero `makefile`. Para ello, basta
con ejecutar lo siguiente:

```sh
$ make
```

Esto generará la memoria del proyecto, el manual de usuario y la presentación en el directorio actual.
También se pueden generar de manera individual:

```sh
# Generar la memoria del TFG
$ make memoriaTFG

# Generar el manual de usuario
$ make manual_usuario

# Generar la presentacion
$ make presentation
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

## :open_file_folder: Acceso a la documentación *online*

Si por el contrario no se quiere clonar el repositorio y generar la documentación manualmente, se
puede acceder a ésta en los siguientes enlaces:

- [Memoria del TFG](https://vol0kin.github.io/TFG/pdfs/memoriaTFG.pdf)
- [Manual de usuario](https://vol0kin.github.io/TFG/pdfs/manual_usuario.pdf)
- [Presentación del TFG](https://vol0kin.github.io/TFG/pdfs/presentation.pdf)

## :computer: Código fuente

Se puede acceder al código fuente del sistema a través del submódulo `gvgai-pddl`. Esto es un enlace
que sirve para redirigir al repositorio donde está alojado el código fuente.


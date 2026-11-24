# ServiFix Android

Proyecto Android nativo con Kotlin, Jetpack Compose y SQLite local.

## Versiones fijadas

| Componente | Versión |
|---|---:|
| Android Gradle Plugin | 8.11.1 |
| Gradle Wrapper | 8.13 |
| Kotlin | 2.2.20 |
| Compose Compiler plugin | 2.2.20 |
| JDK para ejecutar Gradle | 17 |
| compileSdk | 36 |

**Motivo del ajuste:** Kotlin Gradle Plugin 2.2.20 tiene compatibilidad completa documentada hasta AGP 8.11.1 y Gradle 8.14. AGP 8.11.1 requiere Gradle 8.13 y JDK 17. Por eso se conserva Kotlin 2.2.20 y se fija Gradle 8.13 + AGP 8.11.1. No se usa Gradle 9.x.

## Abrir y compilar

1. Extrae el ZIP y abre la carpeta `ServiFix_AndroidStudio` desde Android Studio.
2. En **Settings > Build, Execution, Deployment > Build Tools > Gradle**, selecciona **Gradle JDK 17**. Si Android Studio incluye un JBR/JDK 17 o superior compatible, selecciona **Embedded JDK**. No es necesario que exista una carpeta llamada `jbr` dentro del proyecto.
3. Instala **Android SDK Platform 36** desde SDK Manager.
4. Sincroniza el proyecto y ejecuta la tarea `:app:assembleDebug`.

El wrapper descarga Gradle 8.13 desde `services.gradle.org` la primera vez que se ejecuta; se necesita conexión a Internet para esa descarga y para resolver dependencias de Android/Google Maven.

## Contenido y alcance recibido

El ZIP de origen contenía 10 archivos: configuración Gradle, manifiesto, recursos, `MainActivity.kt` y `LocalDb.kt`. No contenía `gradlew`, `gradlew.bat`, `gradle-wrapper.jar`, catálogo de versiones, pruebas ni otros módulos/pantallas. Se han conservado las pantallas y la estructura SQLite presentes en esos archivos; no se han inventado ni eliminado funcionalidades que no estuvieran en el material recibido.

## Wrapper incluido

Se incluyen `gradlew`, `gradlew.bat`, `gradle/wrapper/gradle-wrapper.properties` y `gradle/wrapper/gradle-wrapper.jar`. El JAR de este paquete es un pequeño lanzador autónomo compatible con esos scripts: descarga y ejecuta la distribución oficial indicada en `gradle-wrapper.properties`. No es el JAR binario oficial generado por la tarea `gradle wrapper` de Gradle.

## Limitación de verificación

La configuración y los archivos fuente se revisaron estáticamente. En el entorno de preparación no hay Android SDK ni acceso de red para descargar Gradle y las dependencias, así que no fue posible ejecutar `:app:assembleDebug` ni afirmar que se completó una compilación real. La sincronización/compilación deberá terminarse en Android Studio con SDK y conexión disponibles.

## Corrección del error `InternalProblems` / Gradle 9.6.0

Si Android Studio muestra que AGP usa una API interna eliminada en Gradle 9.6.0, significa que Android Studio está ejecutando Gradle 9.6.0 en lugar del wrapper del proyecto. Este proyecto fija `distributionUrl` en Gradle 8.13 y añade una preferencia de proyecto para usar `DEFAULT_WRAPPED`.

En Android Studio verifica **Settings > Build, Execution, Deployment > Build Tools > Gradle > Distribution** y selecciona **Wrapper** / **Gradle Wrapper** (no “Local installation” ni una instalación Gradle 9.6.0). En **Gradle JDK**, selecciona JDK 17.

Para comprobarlo desde la terminal abierta en la carpeta raíz del proyecto, ejecuta `gradlew.bat --version`. Debe mostrar `Gradle 8.13`. Si muestra 9.6.0, no se está ejecutando el wrapper de este proyecto o la terminal está situada en otra carpeta.

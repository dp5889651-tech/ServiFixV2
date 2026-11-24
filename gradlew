#!/bin/sh

APP_HOME=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
CLASSPATH="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"

if [ -n "$JAVA_HOME" ]; then
    JAVA_EXE="$JAVA_HOME/bin/java"
else
    JAVA_EXE="java"
fi

if ! command -v "$JAVA_EXE" >/dev/null 2>&1 && [ ! -x "$JAVA_EXE" ]; then
    echo "ERROR: Java was not found. Set JAVA_HOME to a JDK 17 installation." >&2
    exit 1
fi

exec "$JAVA_EXE" -classpath "$CLASSPATH" com.servifix.wrapper.GradleWrapperMain "$@"

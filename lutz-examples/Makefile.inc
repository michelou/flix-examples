ifndef GIT_HOME
$(error Variable GIT_HOME is not set)
endif
ifndef JAVA_HOME
$(error Variable JAVA_HOME is not set)
endif
ifndef SCALA_HOME
$(error Variable SCALA_HOME is not set)
endif
ifndef FLIX_HOME
$(error Variable FLIX_HOME is not set)
endif

ifeq ($(OS),Windows_NT)
JAR        = $(subst \,/,$(JAVA_HOME))/bin/jar.exe
JAVA       = $(subst \,/,$(JAVA_HOME))/bin/java.exe
JAVAC      = $(subst \,/,$(JAVA_HOME))/bin/javac.exe
SCALAC     = $(subst \,/,$(SCALA_HOME))/bin/scalac.bat
LOCAL_REPO = $(subst \,/,$(USERPROFILE))/.m2/repository
PSEP       = ;
CP         = $(subst \,/,$(GIT_HOME))/usr/bin/cp.exe
ECHO       = $(subst \,/,$(GIT_HOME))/usr/bin/echo.exe
## We grab Mingw version instead of C:\Windows\System32\find.exe
FIND       = $(subst \,/,$(GIT_HOME))/usr/bin/find.exe
MKDIR      = $(subst \,/,$(GIT_HOME))/usr/bin/mkdir.exe
RM         = $(subst \,/,$(GIT_HOME))/usr/bin/rm.exe
TOUCH      = $(subst \,/,$(GIT_HOME))/usr/bin/touch.exe
UNZIP      = $(subst \,/,$(GIT_HOME))/usr/bin/unzip.exe
else
JAR        = $(JAVA_HOME)/bin/jar
JAVA       = $(JAVA_HOME)/bin/java
JAVAC      = $(JAVA_HOME)/bin/javac
SCALAC     = $(SCALA_HOME)/bin/scalac
LOCAL_REPO = $(HOME)/.m2/repository
PSEP       = :
CP         = cp
ECHO       = echo
FIND       = find
MKDIR      = mkdir
RM         = rm
TOUCH      = touch
UNZIP      = unzip
endif

SCALA_LIB_JAR  = $(shell $(FIND) "$(LOCAL_REPO)/org/scala-lang" -name scala-library-2.13.10.jar)

NIGHTLY ?=
ifeq ($(NIGHTLY),)
FLIX_LIB_JAR   = $(shell $(FIND) "$(FLIX_HOME)/" -name "flix.jar")
else
FLIX_LIB_JAR   = $(shell $(FIND) "$(FLIX_HOME)/" -name "flix-*.jar" | tail -n 1)
endif

ifeq (,$(wildcard $(SCALA_LIB_JAR)))
$(error Variable SCALA_LIB_JAR is not set)
endif
ifeq (,$(wildcard $(FLIX_LIB_JAR)))
$(error Variable FLIX_LIB_JAR is not set)
endif

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
ifndef GIT_HOME
$(error Variable GIT_HOME is not set)
endif
JAR        = $(subst \,/,$(JAVA_HOME))/bin/jar.exe
JAVA       = $(subst \,/,$(JAVA_HOME))/bin/java.exe
SCALAC     = $(subst \,/,$(SCALA_HOME))/bin/scalac.bat
LOCAL_REPO = $(subst \,/,$(USERPROFILE))/.m2/repository
PSEP       = ;
## $(MSYS_HOME)\usr\bin\{cp.exe, make.exe, wget.exe}
CP         = /usr/bin/cp.exe
CYGPATH    = /usr/bin/cygpath.exe
ECHO       = /usr/bin/echo.exe
FIND       = /usr/bin/find.exe
MKDIR      = /usr/bin/mkdir.exe
RM         = /usr/bin/rm.exe
TOUCH      = /usr/bin/touch.exe
UNZIP      = /usr/bin/unzip.exe
else ifeq ($(OS),cygwin)
JAR        = $(JAVA_HOME)/bin/jar
JAVA       = $(JAVA_HOME)/bin/java
SCALAC     = $(SCALA_HOME)/bin/scalac
LOCAL_REPO = $(HOME)/.m2/repository
PSEP       = :
CP         = cp
CYGPATH    = cygpath
ECHO       = echo
FIND       = find
MKDIR      = mkdir
RM         = rm
TOUCH      = touch
UNZIP      = unzip
else
JAR        = $(JAVA_HOME)/bin/jar
JAVA       = $(JAVA_HOME)/bin/java
SCALAC     = $(SCALA_HOME)/bin/scalac
LOCAL_REPO = $(HOME)/.m2/repository
PSEP       = :
CP         = cp
CYGPATH    =
ECHO       = echo
FIND       = find
MKDIR      = mkdir
RM         = rm
TOUCH      = touch
UNZIP      = unzip
endif

NIGHTLY ?=
ifeq ($(NIGHTLY),)
FLIX_JAR = $(shell $(FIND) "$(subst \,/,$(FLIX_HOME))" -type f -name "flix.jar")
else
FLIX_JAR = $(shell $(FIND) "$(subst \,/,$(FLIX_HOME)))" -type f -name "flix-*.jar" | tail -n 1)
endif

ifeq (,$(wildcard $(FLIX_JAR)))
$(error Variable FLIX_JAR is not set)
endif

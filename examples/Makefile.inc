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
CP         = $(subst \,/,$(GIT_HOME))/usr/bin/cp.exe
CYGPATH    = $(subst \,/,$(GIT_HOME))/usr/bin/cygpath.exe
ECHO       = $(subst \,/,$(GIT_HOME))/usr/bin/echo.exe
## We grab Mingw version instead of C:\Windows\System32\find.exe
FIND       = $(subst \,/,$(GIT_HOME))/usr/bin/find.exe
MKDIR      = $(subst \,/,$(GIT_HOME))/usr/bin/mkdir.exe
RM         = $(subst \,/,$(GIT_HOME))/usr/bin/rm.exe
TOUCH      = $(subst \,/,$(GIT_HOME))/usr/bin/touch.exe
UNZIP      = $(subst \,/,$(GIT_HOME))/usr/bin/unzip.exe
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
JAR_FILE = $(shell $(FIND) "$(FLIX_HOME)" -type f -name "flix.jar")
else
JAR_FILE = $(shell $(FIND) "$(FLIX_HOME)" -type f -name "flix-*.jar" | tail -n 1)
endif

ifeq (,$(wildcard $(JAR_FILE)))
$(error Variable JAR_FILE is not set)
endif

ifeq ($(CYGPATH),)
FLIX_LIB_JAR = $(JAR_FILE)
else
FLIX_LIB_JAR = $(shell $(CYGPATH) -am $(JAR_FILE))
endif
## $(info "11111111111111111 $(FLIX_LIB_JAR)")

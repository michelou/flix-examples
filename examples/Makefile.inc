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
JAVAC      = $(subst \,/,$(JAVA_HOME))/bin/javac.exe
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
JAVAC      = $(JAVA_HOME)/bin/javac
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

FLIX_VERSION  = 0.50.0
SCALA_VERSION = 2.13.14

SCALA_LIB_JAR  = $(shell $(FIND) "$(LOCAL_REPO)/org/scala-lang" -name scala-library-$(SCALA_VERSION).jar)

NIGHTLY ?=
ifeq ($(NIGHTLY),)
FLIX_JAR = $(shell $(FIND) "$(FLIX_HOME)/" -name "flix.jar")
else
FLIX_JAR = $(shell $(FIND) "$(FLIX_HOME)/" -name "flix-*.jar" | tail -n 1)
endif

deps:
	$(eval MVN_OPTS := -quiet)
	$(eval REMOTE_REPO := https://repo1.maven.org/maven2)
	$(eval WGET_OPTS := --user-agent="Mozilla/5.0 (Windows NT 6.3; WOW64; rv:40.0)" --no-check-certificate --directory-prefix="$(TMP)")
	@$(ECHO) "## Check Maven dependencies on $(REMOTE_REPO)"
ifeq (,$(wildcard $(SCALA_LIB_JAR)))
	$(eval GROUP_ID := org.scala-lang)
	$(eval ARTIFACT_ID := scala-library)
	$(eval VERSION := $(SCALA_VERSION))
	$(eval JAR_FILE := $(TMP)/$(ARTIFACT_ID)-$(VERSION).jar)
	$(eval URL := $(REMOTE_REPO)/$(subst .,/,$(GROUP_ID))/$(ARTIFACT_ID)/$(VERSION)/$(ARTIFACT_ID)-$(VERSION).jar)
	$(WGET) $(WGET_OPTS) $(URL) || $(error Failed to download $(ARTIFACT_ID)-$(VERSION).jar)
	$(MVN) $(MVN_OPTS) install:install-file -Dfile="$(JAR_FILE)" -DgroupId=$(GROUP_ID) -DartifactId=$(ARTIFACT_ID) -Dversion=$(VERSION) -Dpackaging=jar
	$(eval SCALA_LIB_JAR := $(shell $(FIND) "$(LOCAL_REPO)/$(subst .,/,$(GROUP_ID))" -name "$(ARTIFACT_ID)-$(VERSION).jar"))
endif
ifeq ($(NIGHTLY),)
ifeq (,$(wildcard $(FLIX_JAR)))
	$(eval ARTIFACT_ID := flix)
	$(eval JAR_FILE := $(TMP)/$(ARTIFACT_ID).jar)
	$(eval URL := https://github.com/flix/flix/releases/download/v$(FLIX_VERSION)/$(ARTIFACT_ID).jar)
	$(WGET) $(WGET_OPTS) $(URL) || $(error Failed to download $(ARTIFACT_ID).jar)
	$(eval FLIX_JAR := $(shell $(FIND) "$(FLIX_HOME)/" -name "$(ARTIFACT_ID).jar")
endif
else  ## latest nightly jar
ifeq (,$(wildcard $(FLIX_JAR)))
	$(eval ARTIFACT_ID := flix)
	$(eval VERSION := latest)
	$(eval JAR_FILE := $(TMP)/$(ARTIFACT_ID)-$(VERSION).jar)
	$(eval URL := https://flix.dev/nightly/$(ARTIFACT_ID)-$(VERSION).jar)
	$(WGET) $(WGET_OPTS) $(URL) || $(error Failed to download $(ARTIFACT_ID)-$(VERSION).jar)
	$(eval FLIX_JAR := $(shell $(FIND) "$(FLIX_HOME)/" -name "$(ARTIFACT_ID)-$(VERSION).jar")
endif
endif

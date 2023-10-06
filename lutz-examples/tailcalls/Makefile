##
## Copyright (c) 2018-2023 Stéphane Micheloud
##
## Licensed under the MIT License.
##
##############################################################################

ROOT_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

USEJAVA ?=

include ../Makefile.inc

PROJECT_NAME = $(shell basename $(ROOT_DIR))

SOURCE_DIR  = src
TARGET_DIR  = target
BUILD_DIR   = $(TARGET_DIR)/$(PROJECT_NAME)
CLASSES_DIR = $(TARGET_DIR)/classes

##############################################################################
## main rules

SOURCES = $(shell $(FIND) "$(SOURCE_DIR)/main" -type f -name "*.flix")
## Starting with version 0.35.0 Flix generates the jar file into directory 'artifact'.
TARGET  = $(BUILD_DIR)/artifact/$(PROJECT_NAME).jar

JAVA_SOURCES = $(shell $(FIND) "$(SOURCE_DIR)/main" -type f -name "*.java")
JAVA_TARGET  = $(TARGET_DIR)/.latest-build

JAVA_OPTS_FILE = $(TARGET_DIR)/javac_opts.txt
JAVA_SOURCES_FILE = $(TARGET_DIR)/javac_sources.txt

JAVAC_FLAGS = -deprecation
MAIN_CLASS= Tailcalls

all: build

ifeq ($(USEJAVA),)
build: $(TARGET)
else 
build: $(JAVA_TARGET)
endif

$(TARGET): $(SOURCES)
	[ -d "$(BUILD_DIR)" ] || "$(MKDIR)" -p "$(BUILD_DIR)"
	cd "$(BUILD_DIR)"; \
	[ -d "build" ] || "$(JAVA)" -jar "$(FLIX_LIB_JAR)" init && \
	"$(RM)" -f "src/Main.flix" && \
	"$(CP)" -r "$(realpath $(SOURCE_DIR)/main)/." src && \
	"$(JAVA)" -jar "$(FLIX_LIB_JAR)" build && \
	"$(JAVA)" -jar "$(FLIX_LIB_JAR)" build-jar

$(JAVA_TARGET): $(JAVA_SOURCES)
	[ -d "$(CLASSES_DIR)" ] || "$(MKDIR)" -p "$(CLASSES_DIR)"
	@$(ECHO) $(JAVAC_FLAGS) -d "$(CLASSES_DIR)" > "$(JAVA_OPTS_FILE)"
	@$(ECHO) $(JAVA_SOURCES) > "$(JAVA_SOURCES_FILE)"
	"$(JAVAC)" "@$(JAVA_OPTS_FILE)" "@$(JAVA_SOURCES_FILE)"
	@$(TOUCH) "$(JAVA_TARGET)"

clean:
	"$(RM)" -rf "$(TARGET_DIR)"

run: build
ifeq ($(USEJAVA),)
	$(eval JARS := $(shell $(FIND) "$(BUILD_DIR)/lib" -type f -name "*.jar"))
	$(eval JAVA_OPTS := $(if $(JARS),-Xbootclasspath/a:"$(JARS)",))
	"$(JAVA)" $(JAVA_OPTS) -jar "$(TARGET)"
else
	$(eval JAVA_OPTS := -cp "$(CLASSES_DIR)")
	"$(JAVA)" $(JAVA_OPTS) $(MAIN_CLASS)
endif

help:
	@$(ECHO) "Usage: make all|build|clean|doc|help|run|test"
	@$(ECHO) ""
	@$(ECHO) "  Subcommands:"
	@$(ECHO) "    all    alias for build"
	@$(ECHO) "    build  compile Java/Flix source files"
	@$(ECHO) "    clean  delete generated files"
	@$(ECHO) "    doc    generate HTML documentation"
	@$(ECHO) "    help   print this help message"
	@$(ECHO) "    run    execute main program \"$(PROJECT_NAME)\""
	@$(ECHO) "    test   execute unit tests with JUnit"
	@$(ECHO) ""
	@$(ECHO) "  Environment:"
	@$(ECHO) "    USEJAVA  if defined build/run Java example"

##############################################################################
## test rules

TEST_SOURCES     = $(shell $(FIND) "$(SOURCE_DIR)/test" -type f -name "*.flix" 2>/dev/null)
TEST_TARGET      = $(BUILD_DIR)/$(PROJECT_NAME).jar.txt

$(TEST_TARGET): $(SOURCES) $(TEST_SOURCES)
	[ -d "$(BUILD_DIR)" ] || "$(MKDIR)" -p "$(BUILD_DIR)"
	cd "$(BUILD_DIR)"; \
	[ -d "build" ] || "$(JAVA)" -jar "$(FLIX_LIB_JAR)" init && \
	"$(RM)" -f "src/Main.flix" "test/TestMain.flix" && \
	"$(CP)" -r "$(realpath $(SOURCE_DIR)/main)/." src && \
	"$(CP)" -r "$(realpath $(SOURCE_DIR)/test)/." test && \
	"$(JAVA)" -jar "$(FLIX_LIB_JAR)" build && \
	"$(JAVA)" -jar "$(FLIX_LIB_JAR)" build-jar
	@$(TOUCH) "$(TEST_TARGET)"

test: $(TEST_TARGET)
	$(eval JARS := $(shell $(FIND) "$(BUILD_DIR)/lib" -type f -name "*.jar"))
	$(eval JAVA_OPTS := $(if $(JARS),-Xbootclasspath/a:"$(JARS)",))
	cd "$(BUILD_DIR)"; \
	"$(JAVA)" $(JAVA_OPTS) -jar "$(FLIX_LIB_JAR)" test

##############################################################################
## phony

.PHONY: all build clean doc help run test

.SUFFIXES:
.SUFFIXES: .class .flix .jar .java

##
## Copyright (c) 2018-2025 Stéphane Micheloud
##
## Licensed under the MIT License.
##
##############################################################################

ROOT_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

include ../Makefile.inc

PROJECT_NAME = $(shell basename $(ROOT_DIR))

SOURCE_DIR  = src
TARGET_DIR  = target
BUILD_DIR=$(TARGET_DIR)/$(PROJECT_NAME)

##############################################################################
## main rules

SCALA_SOURCES = $(shell $(FIND) "$(SOURCE_DIR)/main" -type f -name "*.scala")
SCALA_TARGET  = lib/lib_$(PROJECT_NAME).jar

SOURCES       = $(shell $(FIND) "$(SOURCE_DIR)/main" -type f -name "*.flix")
## Starting with version 0.35.0 Flix generates the jar file into directory 'artifact'.
TARGET        = $(BUILD_DIR)/artifact/$(PROJECT_NAME).jar

all: build

build: $(TARGET)

$(TARGET): $(SOURCES)
	[ -d "$(BUILD_DIR)/lib" ] || "$(MKDIR)" -p "$(BUILD_DIR)/lib"
	cd "$(BUILD_DIR)"; \
	[ -d "build" ] || "$(JAVA)" -jar "$(FLIX_JAR)" init && \
	"$(RM)" -f "src/Main.flix" "test/TestMain.flix" && \
	"$(CP)" -r "$(realpath $(SOURCE_DIR)/main)/." src && \
	"$(SCALAC)" -cp "$(FLIX_JAR)" -d lib $(realpath $(SCALA_SOURCES)) && \
	"$(JAR)" cf "$(SCALA_TARGET)" -C lib . && \
	"$(JAVA)" -jar "$(FLIX_JAR)" build && \
	"$(JAVA)" -jar "$(FLIX_JAR)" build-jar

clean:
	"$(RM)" -rf "$(TARGET_DIR)"

run: build
	$(eval JARS := $(shell $(FIND) "$(BUILD_DIR)/lib" -type f -name "*.jar"))
	$(eval JAVA_OPTS := $(if $(JARS),-Xbootclasspath/a:"$(JARS)",))
	"$(JAVA)" $(JAVA_OPTS) -jar "$(TARGET)"

help:
	@$(ECHO) "Usage: make all|build|clean|doc|help|run|test"
	@$(ECHO) ""
	@$(ECHO) "  Subcommands:"
	@$(ECHO) "    all    alias for build"
	@$(ECHO) "    build  compile Flix/Scala source files"
	@$(ECHO) "    clean  delete generated files"
	@$(ECHO) "    doc    generate HTML documentation"
	@$(ECHO) "    help   print this help message"
	@$(ECHO) "    run    execute main program \"$(PROJECT_NAME)\""
	@$(ECHO) "    test   execute unit tests with JUnit"

##############################################################################
## test rules

TEST_SOURCES = $(shell $(FIND) "$(SOURCE_DIR)/test" -type f -name "*.flix" 2>/dev/null)
TEST_TARGET  = $(BUILD_DIR)/$(PROJECT_NAME).jar.txt

$(TEST_TARGET): $(SOURCES) $(TEST_SOURCES)
	[ -d "$(BUILD_DIR)" ] || "$(MKDIR)" -p "$(BUILD_DIR)"
	cd "$(BUILD_DIR)"; \
	[ -d "build" ] || "$(JAVA)" -jar "$(FLIX_JAR)" init && \
	"$(RM)" -f "src/Main.flix" "test/TestMain.flix" && \
	"$(CP)" -r "$(realpath $(SOURCE_DIR)/main)/." src && \
	"$(CP)" -r "$(realpath $(SOURCE_DIR)/test)/." test && \
	"$(SCALAC)" -cp "$(FLIX_JAR)" -d lib $(realpath $(SCALA_SOURCES)) && \
	"$(JAR)" cf "$(realpath $(SCALA_TARGET))" -C lib . && \
	"$(JAVA)" -jar "$(FLIX_JAR)" build && \
	"$(JAVA)" -jar "$(FLIX_JAR)" build-jar
	@$(TOUCH) "$(TEST_TARGET)"

test: $(TEST_TARGET)
	$(eval JARS := $(shell $(FIND) "$(BUILD_DIR)/lib" -type f -name "*.jar"))
	$(eval JAVA_OPTS := $(if $(JARS),-Xbootclasspath/a:"$(JARS)",))
	cd "$(BUILD_DIR)"; \
	"$(JAVA)" $(JAVA_OPTS) -jar "$(FLIX_JAR)" test

##############################################################################
## phony

.PHONY: all build clean doc help run test

.SUFFIXES:
.SUFFIXES: .class .flix .jar .scala

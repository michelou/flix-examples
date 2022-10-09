include ../Makefile.inc

PROJECT_NAME = purity-reflexion

SOURCE_DIR  = src
TARGET_DIR  = target
BUILD_DIR=$(TARGET_DIR)/$(PROJECT_NAME)

##############################################################################
## main rules

SOURCES = $(shell $(FIND) "$(SOURCE_DIR)/main" -type f -name *.flix)
TARGET  = $(BUILD_DIR)/$(PROJECT_NAME).jar

all: build

build: $(TARGET)

$(TARGET): $(SOURCES)
	[ -d "$(BUILD_DIR)" ] || "$(MKDIR)" -p "$(BUILD_DIR)"
	cd "$(BUILD_DIR)"; \
	[ -d "build" ] || "$(JAVA)" -jar "$(FLIX_LIB_JAR)" init && \
	"$(RM)" -f "src/Main.flix" && \
	"$(CP)" -r "$(realpath $(SOURCE_DIR)/main)/." src && \
	"$(JAVA)" -jar "$(FLIX_LIB_JAR)" build && \
	"$(JAVA)" -jar "$(FLIX_LIB_JAR)" build-jar

clean:
	"$(RM)" -rf "$(TARGET_DIR)"

run: build
	"$(JAVA)" -Xbootclasspath/a:"$(SCALA_LIB_JAR)" -jar "$(TARGET)"

help:
	@$(ECHO) "Usage: make all|build|clean|doc|help|run|test"
	@$(ECHO) ""
	@$(ECHO) "  Subcommands:"
	@$(ECHO) "    all    alias for build"
	@$(ECHO) "    build  compile Java/Scala source files"
	@$(ECHO) "    clean  delete generated files"
	@$(ECHO) "    doc    generate HTML documentation"
	@$(ECHO) "    help   display this help message"
	@$(ECHO) "    run    execute main program $(PROJECT_NAME)"
	@$(ECHO) "    test   execute unit tests with JUnit"

##############################################################################
## test rules

TEST_SOURCES     = $(shell $(FIND) "$(SOURCE_DIR)/test" -type f -name *.flix 2>/dev/null)
TEST_TARGET      = $(BUILD_DIR)/$(PROJECT_NAME).jar.txt

$(TEST_TARGET): $(SOURCES) $(TEST_SOURCES)
	[ -d "$(BUILD_DIR)" ] || "$(MKDIR)" -p "$(BUILD_DIR)"
	cd "$(BUILD_DIR)"; \
	[ -d "build" ] || "$(JAVA)" -jar "$(FLIX_LIB_JAR)" init && \
	"$(RM)" -f "src/Main.flix" "$test/TestMain.flix" && \
	"$(CP)" -r "$(realpath $(SOURCE_DIR)/main)/." src && \
	"$(CP)" -r "$(realpath $(SOURCE_DIR)/test)/." test && \
	"$(JAVA)" -jar "$(FLIX_LIB_JAR)" build && \
	"$(JAVA)" -jar "$(FLIX_LIB_JAR)" build-jar
    @$(TOUCH) "$(TEST_TARGET)"

test: $(TEST_TARGET)
	cd "$(BUILD_DIR)"; \
	"$(JAVA)" -Xbootclasspath/a:"$(SCALA_LIB_JAR)" -jar "$(FLIX_LIB_JAR)" test

##############################################################################
## phony

.PHONY: all build clean doc help run test

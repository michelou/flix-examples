include ../Makefile.inc

SOURCE_DIR  = src
TARGET_DIR  = target
BUILD_DIR=$(TARGET_DIR)/areas

SCALAC_FLAGS = -deprecation -feature

##############################################################################
## main rules

SOURCES = $(shell $(FIND) "$(SOURCE_DIR)/main" -type f -name *.flix)
TARGET  = $(BUILD_DIR)/areas.jar

all: build

build: $(TARGET)
	[ -d "$(TARGET_DIR)/flix" ] || "$(MKDIR)" -p "$(TARGET_DIR)/flix"
	cd "$(TARGET_DIR)/flix"; \
	"$(UNZIP)" -o -q "$(FLIX_LIB_JAR)" "ca/uwaterloo/flix/runtime/**"; \
	"$(JAR)" -uf "$(realpath $(TARGET))" -C . *

$(TARGET): $(SOURCES)
	[ -d "$(BUILD_DIR)" ] || "$(MKDIR)" -p "$(BUILD_DIR)"
	cd "$(BUILD_DIR)"; \
	[ -d "$(BUILD_DIR)/build" ] || "$(JAVA)" -jar "$(FLIX_LIB_JAR)" init; \
	[ -f "$(BUILD_DIR)/src/*.flix" ] && "$(RM)" "$(BUILD_DIR)/src/*.flix"; \
	"$(CP)" -r "$(realpath $(SOURCE_DIR)/main)/." "$(realpath $(BUILD_DIR)/src)"; \
	"$(JAVA)" -jar "$(FLIX_LIB_JAR)" build; \
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
	@$(ECHO) "    run    execute main program $(MAIN_CLASS)"
	@$(ECHO) "    test   execute unit tests with JUnit"

##############################################################################
## test rules

TEST_SOURCES     = $(shell $(FIND) "$(SOURCE_DIR)/test" -type f -name *.flix 2>/dev/null)
TEST_TARGET      = $(BUILD_DIR)/areas.jar.txt

$(TEST_TARGET): $(SOURCES) $(TEST_SOURCES)
	[ -d "$(BUILD_DIR)" ] || "$(MKDIR)" -p "$(BUILD_DIR)"
	cd "$(BUILD_DIR)"; \
	[ -d "$(BUILD_DIR)/build" ] || "$(JAVA)" -jar "$(FLIX_LIB_JAR)" init; \
	[ -f "$(BUILD_DIR)/src/*.flix" ] && "$(RM)" "$(BUILD_DIR)/src/*.flix"; \
	[ -f "$(BUILD_DIR)/test/*.flix" ] && "$(RM)" "$(BUILD_DIR)/test/*.flix"; \
	$(CP) -r "$(realpath $(SOURCE_DIR)/main)/." "$(realpath $(BUILD_DIR)/src)"; \
	$(CP) -r "$(realpath $(SOURCE_DIR)/test)/." "$(realpath $(BUILD_DIR)/test)"; \
	"$(JAVA)" -jar "$(FLIX_LIB_JAR)" build; \
	"$(JAVA)" -jar "$(FLIX_LIB_JAR)" build-jar
    @$(TOUCH) "$(TEST_TARGET)"

test: $(TEST_TARGET)
	cd "$(BUILD_DIR)"; \
	"$(JAVA)" -Xbootclasspath/a:"$(SCALA_LIB_JAR)" -jar "$(FLIX_LIB_JAR)" test

##############################################################################
## phony

.PHONY: all build clean doc help run test

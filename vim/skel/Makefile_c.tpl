############################################################
# Project:
############################################################

PROJECT	= 
TARGET	= 


############################################################
# Compilation flags:
############################################################

INCDIR		=
LIBDIR		=
LIBRAIRIES	= $(LIBDIR)
INCLUDE		= $(INCDIR)
CFLAGS 		=	-Werror			\
			-W			\
			-Wall			\
			-Wextra			\
			-Wundef			\
			-Wno-multichar		\
			-Wtrigraphs		\
			-Wswitch		\
			-Wunused		\
			-Wimplicit		\
			-Wcast-qual		\
			-Wcast-align		\
			-Wwrite-strings		\
			-Wuninitialized		\
			-Winit-self		\
			-Wmissing-prototypes	\
			-Wpacked		\
			-Wnested-externs	\
			-Waggregate-return	\
			-Wshadow		\
			-pedantic		\
			-fno-common		\
			-DLINUX			\
			-D_XOPEN_SOURCE=600	\
			-O2			\
			-std=c99

# For debug and valgrind
ifdef DEBUG
	CFLAGS += -g -ggdb3
endif
ifdef VALGRIND
	CFLAGS += -g -DGLIBC_FORCE_NEW -ggdb3
endif
CFLAGS+= $(INCLUDE)


############################################################
# Files and directories
############################################################

SRC = src
BIN = bin
OBJ = obj
OBJ_DIR = $(OBJ)
BIN_DIR = $(BIN)
SRC_FILES = $(wildcard $(SRC)/*.c)
HDR_FILES = $(wildcard $(SRC)/*.h)
OBJ_FILES = $(subst $(SRC),$(OBJ_DIR),$(SRC_FILES:.c=.o))


############################################################
# Build:
############################################################

# make all
all: $(BIN_DIR)/$(TARGET)

# making all the *.o
$(OBJ_DIR)/%.o: $(SRC)/%.c $(HDR_FILES)
	$(CC) $(CFLAGS) -o $@ -c $<

# make project
$(BIN_DIR)/$(TARGET): $(OBJ_FILES) 
	$(CC) $(CFLAGS) -o "$(BIN_DIR)/$(TARGET)" $(OBJ_FILES) $(LIBRAIRIES)


############################################################
# Maintenance:
############################################################

# clean
clean:
	rm -f $(OBJ_FILES)

distclean: clean
	rm -f $(BIN_DIR)/$(TARGET)

dist: distclean
	echo FIXME

# running the program
run:
ifdef VALGRIND
	@echo " #"
	@echo " # RUN $(BIN_DIR)/$(TARGET)"
	@echo " #     WITH valgrind --leak-check=yes --show-reachable=yes"
	@echo " #"
	@valgrind --leak-check=yes --show-reachable=yes $(BIN_DIR)/$(TARGET)
else
	@echo " #"
	@echo " # RUN $(BIN_DIR)/$(TARGET)"
	@echo " #"
	@$(BIN_DIR)/$(TARGET)
endif

check:
	@cd test-suite && make check

help:
	@echo	"make all:	build $(TARGET)"
	@echo	"make check:	test $(PROJECT)"

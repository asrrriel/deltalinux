SRC_DIR = src
OBJ_DIR = obj

C_SRC = $(shell find $(SRC_DIR) -name "*.c")
C_OBJ = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(C_SRC))

CC = gcc
CFLAGS = -Wall -I$(SRC_DIR)

$(shell mkdir -p $(OBJ_DIR))

all: ralsei

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

ralsei: $(C_OBJ)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -rf $(OBJ_DIR)/*.o $(GEN_DIR)/*.c testk

install:
	mkdir -p $(DESTDIR)/usr
	mkdir -p $(DESTDIR)/usr/bin
	cp ralsei $(DESTDIR)/usr/bin
	ln -sf ralsei $(DESTDIR)/usr/bin/ral


# Phony targets
.PHONY: all clean install

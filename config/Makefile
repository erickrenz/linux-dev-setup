UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S), Linux) 
	TARGET_DIR := /home/ekrenz/
endif
ifeq ($(UNAME_S), Darwin) 
	TARGET_DIR := /Users/erickrenz/
endif

all:
	stow --verbose --target=$(TARGET_DIR) --restow */

clean:
	stow --verbose --target=$(TARGET_DIR) --delete */

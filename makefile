

# ------------------------------------------------
# Generic Makefile
#
# Author: yanick.rochon@gmail.com
# Date  : 2011-08-10
#
# Changelog :
#   2010-11-05 - first version
#   2011-08-10 - added structure : sources, objects, binaries
#				thanks to http://stackoverflow.com/users/128940/beta
#   2017-04-24 - changed order of linker params
# ------------------------------------------------

# project name (generate executable with this name)


# compiling flags here

LIBOUT = cutils.a

CC = gcc


ODIR = obj
SDIR = src


CFLAGS = -Wall -g -fPIC -O2 -Wextra -fPIC -L./bin
RSFLAGS = -O


# change these to proper directories where each file should be
SRCDIR   = src
OBJDIR   = obj
BINDIR   = bin

SOURCES  := $(wildcard $(SRCDIR)/*.c)
INCLUDES := $(wildcard $(SRCDIR)/*.h)
OBJECTS  := $(SOURCES:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

FMT_DIR = src/formats


all: $(BINDIR)/$(LIBOUT)
	@echo "BUILD SUCESSFUL"

$(BINDIR)/$(LIBOUT): $(OBJECTS)
	@$(CC) $(OBJECTS) $(LIBS) $(LFLAGS) -o $@ -shared
	@echo "Linking complete!"

$(OBJECTS): $(OBJDIR)/%.o : $(SRCDIR)/%.c

	@if [ ! -d $(OBJDIR) ]; then mkdir $(OBJDIR); fi
	@if [ ! -d $(BINDIR) ]; then mkdir $(BINDIR); fi

	@$(CC) $(CFLAGS) -c $< -o $@
	@echo "Compiled "$<" successfully!"




test:
	$(CC) $(CFLAGS) test.c ${BINDIR}/${LIBOUT} -o bin/cutils 


debug:
	$(CC) $(CFLAGS) -g test.c src/* -o bin/cutils -DDEBUG=3


clean:
	rm -f $(ODIR)/*.o $(BINDIR)/$(LIBOUT) $(BINDIR)/cutils 

install:
	if [ ! -d "/usr/local/lib/spm" ]; then mkdir -p /usr/local/lib/spm; fi
	cp -rf include/* $(DESTDIR)/usr/include/spm
	cp $(BINDIR)/$(LIBOUT) $(DESTDIR)/lib
	cp $(BINDIR)/$(EXEOUT) $(DESTDIR)/bin
	cp -rf $(BINDIR)/plugins/* $(DESTDIR)/var/cccp/plugins


	



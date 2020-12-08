.phony: all prep release clean

# CUSTOMIZE: compiler and flags
CFLAGS= -O2 -fPIE -fstack-protector-all -D_FORTIFY_SOURCE=2 
LDFLAGS= -Wl,-z,now -Wl,-z,relro -Wl,-no-as-needed -lseccomp 
CC= gcc 

SDIR= src
ODIR= dist
SRCS= $(wildcard $(SDIR)/*.c)
_OBJS= $(SRCS:.c=.o) 
OBJS= $(_OBJS:$(SDIR)=$(ODIR))
TARGET= $(ODIR)/chall

all: prep $(TARGET) release

prep:
	mkdir -p $(ODIR)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $(TARGET) $(OBJS)

$(ODIR)/%.o: $(SDIR)/%.c 
	$(CC) $(CFLAGS) -c $< -o $@

release:
	strip --strip-all $(TARGET)
	rm -rf $(OBJS)

clean:
	rm -rf $(ODIR)

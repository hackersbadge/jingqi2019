CFLAGS+= -Os -std=gnu99

OBJECTS = jd-jingqi

all : $(OBJECTS)

PKG_NAME = jd-jingqi


jd-jingqi: jd-jingqi.o oled.o
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -lpthread

clean:
	rm -rf jd-jingqi *.d *.o

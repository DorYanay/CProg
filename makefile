CC = gcc
CFLAGS = -Wall
AR = ar

all: mains maindloop maindrec

loops: libclassloops.a

libclassloops.a: basicClassification.o advancedClassificationLoop.o
			$(AR) -rcs libclassloops.a basicClassification.o advancedClassificationLoop.o

basicClassification.o: basicClassification.c NumClass.h
			$(CC) $(CFLAGS) -c basicClassification.c

advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
			$(CC) $(CFLAGS) -c advancedClassificationLoop.c

recursives: libclassrec.a

libclassrec.a: basicClassification.o advancedClassificationRecursion.o
			$(AR) -rcs libclassrec.a basicClassification.o advancedClassificationRecursion.o

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
			$(CC) $(CFLAGS) -c advancedClassificationRecursion.c

recursived: libclassrec.so

libclassrec.so: basicClassification.o advancedClassificationRecursion.o
			$(CC) -shared -fPIC -o libclassrec.so basicClassification.o advancedClassificationRecursion.o

loopd: libclassloops.so

libclassloops.so: basicClassification.o advancedClassificationLoop.o
			$(CC) -shared -fPIC -o libclassloops.so basicClassification.o advancedClassificationLoop.o

mains: main.o libclassrec.a
			$(CC) $(CFLAGS) main.o libclassrec.a -o mains

main.o: main.c NumClass.h
			$(CC) $(CFLAGS) -c main.c

maindloop: main.o libclassloops.so
			$(CC) $(CFLAGS) main.o libclassloops.so -o mainsdloop


maindrec: main.o libclassrec.so
			$(CC) $(CFLAGS) main.o libclassrec.so -o maindrec


clean: 
			rm -f mains maindloop maindrec *.o *.a *.so	

.PHONY: loops recursives recursived loopd 					
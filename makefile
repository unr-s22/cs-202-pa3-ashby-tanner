CC=g++
CXXFLAGS=-g -Wall
APP=pa3
SRC=src
BIN=bin

OBJS=

$(APP): $(OBJS) $(SRC)/main.cpp
	$(CC) $(CXXFLAGS) -o $(BIN)/$@ $^

%.o: %.cpp
	$(CC) $(CXXFLAGS) -c $^

clean:
	rm *.o

run:
	$(BIN)/./$(APP)
CPP = g++

TARGET	= mjpg_rec 

DIR		= . 
INC		= -I. 
CFLAGS	= -g -Wall

OBJPATH	= .

FILES	= $(foreach dir,$(DIR),$(wildcard $(dir)/*.cpp))

OBJS	= $(patsubst %.cpp,%.o,$(FILES))

all:$(OBJS) $(TARGET)

$(OBJS):%.o:%.cpp
	$(CPP) $(CFLAGS) $(INC) -c -o $(OBJPATH)/$(notdir $@) $< 

$(TARGET):$(OBJPATH)
	$(CPP) -o $@ $(OBJPATH)/*.o

clean:
	-rm $(OBJPATH)/*.o
	-rm $(TARGET)
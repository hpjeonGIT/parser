antlr4 := java -Xmx500M -cp /home/hpjeon/sw_local/antlr4/antlr-4.8-complete.jar:.:/home/hpjeon/sw_local/antlr4/antlr-4.8-complete.jar org.antlr.v4.Tool

all: build

build:
	$(antlr4) CUSTOM.g4 -o generated
	javac generated/*java

clean:
	rm -rf generated

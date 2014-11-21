CC = iverilog

all: checksum sender receiver

checksum:
	$(CC) -o $@ $@.v $@_tb.v

sender: checksum.v
	$(CC) -o $@ $@.v $@_tb.v $<

receiver: checksum.v
	$(CC) -o $@ $@.v $@_tb.v $<

clean:
	rm checksum sender receiver

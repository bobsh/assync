.PHONY: nats-tools
nats-tools: $(NATS_BIN) ## Install NATs tooling

$(NATS_BIN):
	$(eval TMP := $(shell mktemp -d))
	mkdir -p $(TMP) &&\
	cd $(TMP) &&\
	wget $(NATS_DOWNLOAD) -O nats-streaming-server.zip &&\
	unzip nats-streaming-server.zip &&\
	mkdir -p $(shell dirname $(NATS_BIN)) &&\
	mv nats-streaming-server-$(NATS_VERSION)-$(OS_LC)-amd64/nats-streaming-server $(NATS_BIN) &&\
	rm -rf $(TMP)

.PHONY: nats-clean
nats-clean:
	rm -rf $(NATS_BIN)

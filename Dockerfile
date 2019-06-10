ARG from='python'
ARG tag='latest'
FROM ${from}:${tag}
COPY . /usr/src/assync

WORKDIR /usr/src/assync
RUN make tools
RUN make deps
RUN make lint
RUN make test
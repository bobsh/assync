ARG from='python'
ARG tag='3.7.3-stretch'
FROM ${from}:${tag}

COPY . /usr/src/assync

WORKDIR /usr/src/assync

# Python user path
ENV PATH=/root/.local/bin:$PATH

RUN make tools
RUN make deps
RUN make lint
RUN make test
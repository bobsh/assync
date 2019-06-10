ARG from='python'
ARG tag='3.7.3-stretch'


FROM ${from}:${tag} as builder
COPY . /usr/src/assync
WORKDIR /usr/src/assync
ENV PATH=/root/.local/bin:$PATH
RUN make all &&\
    asstool


FROM ${from}:${tag} as release
COPY --from=builder /usr/src/assync/dist/*.whl /root
WORKDIR /root
RUN pip3 install --no-cache-dir assync*.whl &&\
    rm -f assync*.whl &&\
    asstool

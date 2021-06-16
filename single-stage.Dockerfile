FROM ubuntu:latest
RUN echo "test" > /dummy

RUN cat /dummy

CMD ["cat /dummy"]

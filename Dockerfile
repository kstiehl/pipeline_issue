FROM ubuntu:latest as build
RUN echo "test" > /dummy

FROM ubuntu:latest
COPY --from=build /dummy /

RUN cat /dummy

CMD ["cat /dummy"]

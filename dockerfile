FROM alpine AS builder
RUN apk add --no-cache curl

FROM scratch
COPY --from=builder /bin/cp cp
COPY --from=builder /lib/ld-musl-x86_64.so.1 /lib/ld-musl-x86_64.so.1
COPY --from=builder /bin/ping ./ping
COPY --from=builder /usr/lib/libcurl.so.4 /usr/lib/libcurl.so.4
COPY --from=builder /lib/libz.so.1 /lib/libz.so.1
COPY --from=builder /lib/ld-musl-x86_64.so.1 /lib/ld-musl-x86_64.so.1
COPY --from=builder /usr/lib/libcares.so.2 /usr/lib/libcares.so.2
COPY --from=builder /usr/lib/libnghttp2.so.14 /usr/lib/libnghttp2.so.14
COPY --from=builder /usr/lib/libidn2.so.0 /usr/lib/libidn2.so.0
COPY --from=builder /lib/libssl.so.3 /lib/libssl.so.3
COPY --from=builder /lib/libcrypto.so.3 /lib/libcrypto.so.3
COPY --from=builder /usr/lib/libbrotlidec.so.1 /usr/lib/libbrotlidec.so.1
COPY --from=builder /usr/lib/libunistring.so.5 /usr/lib/libunistring.so.5
COPY --from=builder /usr/lib/libbrotlicommon.so.1 /usr/lib/libbrotlicommon.so.1
COPY --from=builder /bin/cp cp
COPY --from=builder /bin/sh ./sh
COPY --from=builder /usr/bin/curl ./curl
ENTRYPOINT ["./sh"]
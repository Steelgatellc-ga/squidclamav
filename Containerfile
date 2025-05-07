FROM oraclelinux:9

LABEL org.opencontainers.image.authors="matthew.cundari"

RUN dnf install -y --nodocs oracle-epel-release-el9 && dnf install -y --nodocs squid squidclamav clamav clamav-freshclam clamd && freshclam

# RUN dnf install --nodocs -y net-tools nano #DEBUGTOOLS

COPY config/c-icap.conf /etc/c-icap/c-icap.conf
COPY config/scan.conf /etc/clamd.d/scan.conf
COPY config/squid.conf /etc/squid/squid.conf
COPY config/squidclamav.conf /etc/c-icap/squidclamav.conf
COPY config/entrypoint.sh /entrypoint.sh

RUN mkdir /run/clamd.scan && chown clamscan /run/clamd.scan

EXPOSE 1344/tcp

ENTRYPOINT [ "/entrypoint.sh" ]

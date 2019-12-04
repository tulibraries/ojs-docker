ARG tag_name="ojs-3_1_2-3"
FROM arturluizbr/pkp-ojs:latest
RUN apt-get update && apt-get install -y s3fs

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "apache2ctl", "-DFOREGROUND" ]

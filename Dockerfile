FROM returntocorp/semgrep

# Install jq.
RUN apk add --no-cache --virtual=build-deps wget && \
  wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && \
  mv jq-linux64 /usr/local/bin/jq && \
  chmod +x /usr/local/bin/jq && \
  apk del build-deps

COPY entrypoint.sh /src/

ENTRYPOINT ["/src/entrypoint.sh"]

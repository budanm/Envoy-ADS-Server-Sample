FROM envoyproxy/envoy-dev:latest

COPY envoy.yaml /etc/
CMD /usr/local/bin/envoy -c /etc/envoy.yaml --service-cluster edge-envoy --log-level info
EXPOSE 19000
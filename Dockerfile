FROM nginx:1.25.1-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY public /usr/share/nginx/html
EXPOSE 80

HEALTHCHECK --interval=15s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://127.0.0.1/health || exit 1

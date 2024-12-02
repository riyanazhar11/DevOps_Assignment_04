FROM node:16-alpine AS builder
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
USER root
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
FROM nginx:alpine
RUN addgroup -S appgroup && adduser -S appuser -G appgroup && \
    chown -R appuser:appgroup /usr/share/nginx/html
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 80
USER appuser
CMD ["nginx", "-g", "daemon off;"]

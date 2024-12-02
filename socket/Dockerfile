FROM node:16-alpine AS builder
RUN addgroup -S socketgroup && adduser -S socketuser -G socketgroup
WORKDIR /app
USER root
COPY package*.json ./
RUN npm ci --only=production
COPY . .
FROM node:16-alpine
WORKDIR /app
COPY --from=builder /app .
USER socketuser
EXPOSE 8080
CMD ["node", "socket-server.js"]

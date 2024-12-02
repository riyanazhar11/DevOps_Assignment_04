# Stage 1: Build stage
FROM node:16-alpine AS builder

# Use a non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Install dependencies as root
USER root

# Copy package.json and package-lock.json (if exists) and install dependencies
COPY package*.json ./

# Clear npm cache to prevent issues with cached dependencies
RUN npm cache clean --force

# Fallback to npm install if npm ci fails
RUN npm ci --only=production || npm install --only=production

# Copy source code and build the app
COPY . .
#RUN npm run build

# Stage 2: Final stage
FROM node:16-alpine

WORKDIR /app

# Copy only necessary files from the builder stage
COPY --from=builder /app .

# Switch to non-root user
USER appuser

EXPOSE 3000

CMD ["npm", "start"]

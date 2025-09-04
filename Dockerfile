# Use official Node.js 18 image
FROM node:18-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application
COPY . .

# Expose port for health/readiness probes
EXPOSE 3000

# Default command
CMD ["npm", "run", "dev"]

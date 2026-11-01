# Stage 1: Build stage
FROM node:24-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY server.js app-logic.js ./

# Stage 2: Production runtime
FROM node:24-alpine AS runtime

ENV NODE_ENV=production
ENV PORT=3000

WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev && npm cache clean --force \
    && rm -rf /usr/local/lib/node_modules/npm

COPY --from=build /app/server.js ./server.js
COPY --from=build /app/app-logic.js ./app-logic.js

USER node

EXPOSE 3000

CMD ["node", "server.js"]

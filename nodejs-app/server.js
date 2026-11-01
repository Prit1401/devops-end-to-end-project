const http = require('http');
const { createClient } = require('redis');
const { buildResponse } = require('./app-logic');

const PORT = process.env.PORT || 3000;
const REDIS_URL = process.env.REDIS_URL || 'redis://localhost:6379';

const redis = createClient({ url: REDIS_URL });

redis.on('error', (err) => {
  console.error('Redis error:', err.message);
});

async function startServer() {
  await redis.connect();

  const server = http.createServer(async (req, res) => {
    try {
      const visits = await redis.incr('visits');

      res.writeHead(200, {
        'Content-Type': 'application/json'
      });

      res.end(JSON.stringify(buildResponse(visits)));

    } catch (err) {
      console.error('Request error:', err.message);

      res.writeHead(500, {
        'Content-Type': 'application/json'
      });

      res.end(JSON.stringify({ status: 'error' }));
    }
  });

  server.listen(PORT, '0.0.0.0', () => {
    console.log(`Server running on port ${PORT}`);
  });
}

startServer().catch((err) => {
  console.error('Failed to start application:', err.message);
  process.exit(1);
});

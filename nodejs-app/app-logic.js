function buildResponse(visits) {
  return {
    message: 'Hello from our DevOps Node.js application!',
    status: 'healthy',
    visits
  };
}

module.exports = { buildResponse };

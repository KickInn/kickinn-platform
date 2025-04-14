// Kick Inn – Basic API Test Suite (Jest + Supertest)
// To be saved in test/api.test.js and run with: `npx jest`

const request = require('supertest');
const app = require('../app'); // or your express instance path

describe('Kick Inn API', () => {
  it('registers a new user', async () => {
    const res = await request(app)
      .post('/api/auth/register')
      .send({ email: 'test@kickinn.xyz', role: 'ideator' });

    expect(res.statusCode).toBe(200);
    expect(res.body).toHaveProperty('userId');
  });

  it('submits a new idea', async () => {
    const res = await request(app)
      .post('/api/deal/create')
      .send({ problem_statement: 'Too many manual invoices', category: 'Fintech' });

    expect(res.statusCode).toBe(201);
    expect(res.body).toHaveProperty('ideaId');
  });

  it('fetches a deal by ID', async () => {
    const res = await request(app)
      .get('/api/deal/test-idea-id');

    expect([200, 404]).toContain(res.statusCode); // handles valid or not-found
  });

  it('logs an event', async () => {
    const res = await request(app)
      .post('/api/track')
      .send({ event: 'UserSignedUp', payload: { role: 'investor' } });

    expect(res.statusCode).toBe(200);
  });

  it('commits an investment', async () => {
    const res = await request(app)
      .post('/api/investment/commit')
      .send({ deal_id: 'test-deal-id', amount: 100 });

    expect([200, 400]).toContain(res.statusCode); // depending on testnet or local mock
  });
});

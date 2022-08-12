module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', '6e2a13a7105a9f6349cb826c1eda5ded'),
  },
});

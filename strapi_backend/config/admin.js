module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', '99c09e14cae0fe8e78adad58345f1ae8'),
  },
});

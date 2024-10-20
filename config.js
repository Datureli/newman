// config.js
require('dotenv').config();

module.exports = {
  MOCK_API_URL: process.env.MOCK_API_URL,
  MOCK_API_PATH: process.env.MOCK_API_PATH,
  TRANSACTIONS_PATH: process.env.TRANSACTIONS_PATH,
  TOKEN: process.env.TOKEN
};

module.exports = {
  get: jest.fn().mockImplementation((req, res) => res.sendStatus(200)),
  update: jest.fn().mockImplementation((req, res) => res.sendStatus(200)),
};

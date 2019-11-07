const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan');

const app = express();

const ads = [
  {title: 'This application print the headers to the console'}
];

// API's security
app.use(helmet());

app.use(bodyParser.json());
app.use(cors());
app.use(morgan('combined'));

app.get('/', (req, res) => {
  res.send(ads);
  console.log(JSON.stringify(req.headers, null, 4));
});

app.listen(3001, () => {
  console.log('listening on port 3001');
});
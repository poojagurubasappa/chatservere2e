const express = require("express");
const https = require("https");
const cors = require("cors");
const fs = require("fs");
const mongoose = require("mongoose");
require("dotenv").config();

const socketServer = require("./socketServer");
const authRoutes = require("./routes/authRoutes");
const friendInvitationRoutes = require("./routes/friendInvitationRoutes");

const PORT = process.env.PORT || process.env.API_PORT;

const app = express();
app.use(express.json());
app.use(cors());

// register the routes
app.use("/api/auth", authRoutes);
app.use("/api/friend-invitation", friendInvitationRoutes);

const options = {
  key: fs.readFileSync('ssl/key.pem'),
  cert: fs.readFileSync('ssl/cert.pem')
};

const server = https.createServer(options, app);
socketServer.registerSocketServer(server);

mongoose
  .connect(process.env.MONGO_URI)
  .then(() => {
    server.listen(PORT, () => {
      console.log(`Server is listening on ${PORT}`);
    });
  })
  .catch((err) => {
    console.log("database connection failed. Server not started");
    console.error(err);
  });


  /*
if (localDevHttps) {
  const https = require('https');
  const fs = require('fs');

  // Ensures we can use HTTPS on a development environment - NOT intended to run in LIVE
  httpProcess = https.createServer(
    {
      key: fs.readFileSync(config.get('server:sslPaths:key')),
      cert: fs.readFileSync(config.get('server:sslPaths:cert'))
    },
    app
  );
} else {
  httpProcess = app;
}
*/
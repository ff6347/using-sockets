var server = require('http').createServer();
var io = require('socket.io')(server);
io.on('connection', (client) =>{
  console.log(`we have a client ${client.id}`);
  client.on('event', (data) => {
    console.log(data);
  });
  client.on('message', (msg)=>{
    console.log(msg);
  });
  setInterval(()=>{
    client.send('ping');
    console.log('send a ping');
  }, 5000);
  client.on('disconnect', () => {
    console.log('disconnected from client');
  });
});
server.listen(3000);

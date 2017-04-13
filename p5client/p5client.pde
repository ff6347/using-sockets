// using this lib
// https://github.com/alexandrainst/processing_websockets
// download it and place it into your libraries folder
//
// this issue helped to fix initial problems
// https://github.com/alexandrainst/processing_websockets/issues/3
import websockets.*;

WebsocketClient wsc;
int now;
void setup(){
wsc = new WebsocketClient(this, "ws://localhost:3000/socket.io/?EIO=3&transport=websocket");
now = millis();
}

void draw(){

  if(millis() > now + 5000){
    try{
      wsc.sendMessage("42[\"message\",{\"msg\":\"hello from processing\"}]");
    }catch (Exception e){
      println(e);
    }
    now = millis();
  }
}

//This is an event like onMouseClicked. If you chose to use it, it will be executed whenever the server sends a message
void webSocketEvent(String msg){
 println(msg);
}

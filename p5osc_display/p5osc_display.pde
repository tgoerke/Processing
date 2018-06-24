// receive /player <id> <name> as OSC message and display <name>

import oscP5.*;
import netP5.*;

OscP5 oscP5;
String display="", old_display="";

void setup() {
  size(1000,200);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 9999 */
  oscP5 = new OscP5(this,9999);
  oscP5.plug(this,"player","/player");
}

public void player(int id, String name) {
  println("received: "+id+", "+name);  
  display=name;
}

void draw() {
  if (display != old_display) background(255,255,255,255);
  textSize(128);
  text(display, 0, 150); 
  fill(0, 0, 0);
  
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* with theOscMessage.isPlugged() you check if the osc message has already been
   * forwarded to a plugged method. if theOscMessage.isPlugged()==true, it has already 
   * been forwared to another method in your sketch. theOscMessage.isPlugged() can 
   * be used for double posting but is not required.
  */  
  if(theOscMessage.isPlugged()==false) {
  /* print the address pattern and the typetag of the received OscMessage */
  println("### received an osc message.");
  println("### addrpattern\t"+theOscMessage.addrPattern());
  println("### typetag\t"+theOscMessage.typetag());
  }
}
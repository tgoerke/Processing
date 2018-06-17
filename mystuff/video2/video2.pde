// https://processing.org/tutorials/video/
import processing.video.*;

Capture video;

void setup() {
  size(320, 240);  
  video = new Capture(this, 320, 240); 
  video.start();
}

void captureEvent(Capture video) {  
  video.read();
}

void draw() {  
  background(255);  
  tint(mouseX, mouseY, 255);  
  translate(width/2, height/2);  
  imageMode(CENTER);  
  rotate(radians(mouseX));  
  image(video, 0, 0, mouseX, mouseY);
}
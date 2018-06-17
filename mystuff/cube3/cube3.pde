//Super simple cube that rotates 
import processing.opengl.*;
float y = 0.1;
float x = 0.1;
float z = 0.1;
void setup()
  {
    size(800,600,P3D);
    smooth();
  }
void draw()
  {
    lights();
    translate(400,300,0);
    rotateX(x);
    rotateY(radians(mouseY));
    rotateZ(radians(mouseX));
    background(255);
    fill(255,228,225);
    box(200);
    x += random(.1);
    y += random(.1);
    z += random(.1);
  }
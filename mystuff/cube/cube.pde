// based on https://forum.processing.org/one/topic/rotate-cube-sensor.html

float xx,yy,zz;

float bgcolor;            // Background color
float fgcolor;            // Fill color
float xpos, ypos;            // Starting position of the ball

void setup() {
  size(640,480, P3D); 
  // draw with smooth edges:
  smooth();
}

void draw() {
  background(0);
  noStroke();
  translate(width/2, height/2);
  pushMatrix();
  rotateX(mouseY);//pitch
  rotateY(mouseX);//yaw
  rotateZ(xx);//roll
  box(50, 20, 300);
  popMatrix();
  println("roll: " + xx);
  println("pitch: " + yy);
  println("Yaw: " + zz);
}

// based on https://forum.processing.org/two/discussion/3080/rotating-cubes
// Size of cubes
float bounds = 200;
float angle1;
 
void setup() {
  size(800, 800, P3D);  
  smooth();
}
 
void draw() {
  background(0);
  lights();
 
  drawACube ( width/2, height/2, -130, bounds, angle1 );
  //drawACube ( width/2-240, height/2+240, -130, 60, angle1 );
  //drawACube ( width/2+240, height/2+240, -130, 30, angle1 );
}
 
// -----------------------------------------
 
void drawACube ( float x, float y, float z, 
float size, float angle) {
 
 
  pushMatrix();
  // Center in display window
  translate(x, y, z);
 
  // Rotate cube
  // noFill();
  fill(0);
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));
  stroke(255);
 
  // Transparent cube, just using box() method 
 
  box(size);
  popMatrix();
}
 
//
// https://forum.processing.org/two/discussion/13500/applying-a-texture-to-a-sphere

PImage earth; 
PShape globe;
 
void setup() { 
  size(600, 600, P3D); 
  background(0); 
  String http = "http://";
  earth = loadImage( http + "previewcf.turbosquid.com/Preview/2014/08/01__15_41_30/Earth.JPG5a55ca7f-1d7c-41d7-b161-80501e00d095Larger.jpg");
  globe = createShape(SPHERE, 200); 
  globe.setTexture(earth);
  noStroke();
}
 
void draw() { 
  translate(width/2, height/2); 
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));

  shape(globe);
}
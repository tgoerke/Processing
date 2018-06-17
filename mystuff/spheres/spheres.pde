
import processing.opengl.*;

// 

void setup()
{
 size(800, 600, OPENGL);
 smooth();
 
}

void draw()
{
 background(255);
 lights();
 //noStroke();
 
 translate(width/2, height/2);


fill(255, 0, 0);
 pushMatrix();


   rotateX(radians(100*3));
   rotateY(radians(100*3));
   sphereDetail(30);
   sphere(100);

 popMatrix();
 
 fill(0, 255, 0);
 pushMatrix();
   rotateY(radians(frameCount*2));
   translate(-200, 0);
   sphereDetail(30);
   sphere(50);
 popMatrix();
 

 fill(255, 0, 255);
 pushMatrix();
   rotateZ(radians(frameCount*2));
   translate(200, 0);
   sphereDetail(15);
   sphere(50);
 popMatrix();
 
 fill(255, 255, 0);
 pushMatrix();
   rotateX(radians(frameCount*2));
   rotateY(radians(frameCount*2));
   translate(0, 130);
   sphereDetail(15);
   sphere(30);
 popMatrix();
}
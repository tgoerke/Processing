float x,y;
float easing = 0.05;

void setup() {
  size(480, 480);
}

void draw() {
  float targetX = mouseX;
  float targetY = mouseY;
  x += (targetX - x) * easing;
  y += (targetY - y) * easing;
  ellipse(x, y, 12, 12);
}
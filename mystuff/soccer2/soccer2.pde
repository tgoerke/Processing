//Soccer Game
//by James Storer 
//https://www.openprocessing.org/sketch/188379

// pjs preloader is used to preload the ball image and background
/* @pjs preload="http://i.imgur.com/hFGHbvh.png, https://41.media.tumblr.com/082fffcb739e89e2c40ddb2a4032d470/tumblr_nkscir9oDi1up8tfoo1_75sq.png"; */


/////////////////////////////////////////////Setup/////////////////////////////////////////////
//Here I setup the window to be 600 pixels wide by 400 tall. I also load my ball
//image and background image into the script and name them "bg" and "ball".
//The "noCursor" code hides the cursor when it is above the java window.
void setup(){
  size(600,400);
  bg = loadImage("http://i.imgur.com/hFGHbvh.png");
  ball = loadImage("https://41.media.tumblr.com/082fffcb739e89e2c40ddb2a4032d470/tumblr_nkscir9oDi1up8tfoo1_75sq.png");  
  noCursor();                     
}
PImage bg;
PImage ball;

/////////////////////////////////////////////Variables/////////////////////////////////////////////
float ballX = 200;
float ballY = 100;
float speedX = 7;
float speedY = 0;
int hit = 0;
int miss = 0;

void draw(){
  float paddle = 1000/ (hit+10);                             //This creates the shinking paddle
  if(ballX < 30 || ballX > width-25) speedX = -speedX;       //If the ball reaches the sides it will change direction
  if(ballY > (height - 40)){                                 //If the ball reaches the top it will decelerate
    speedY = -speedY;
    float distance = abs(mouseX - ballX);
    if(distance < paddle) hit ++;                            //If the ball hits the paddle, the "hit" counter will add 1.
    else miss = 1;                                           //Otherwise the ball will miss
    if(miss > 0) hit = 0;                                    //If the ball misses, the hit counter will be set at 0 untill reset. 
  } 
  else speedY+= 1;                                           //Acceleration 
  
  ballX += speedX; 
  ballY += speedY;
  imageMode(CORNERS);                                        //this code makes the background position at the corner
  background(bg);                                            //Sets the background image 
  imageMode(CENTER);                                         //set the ball to be centered
  image(ball, ballX, ballY);
  
 /////////////////////////////////////////////Paddle Properties/////////////////////////////////////////////
 //Here I create a paddle that tracks to the mouseX position. 
 //I have it set to the bottom of the screen on the y axis.
 //I then create the shinkinking effect with the width of the rectangle
  fill(0);
  rect(mouseX - paddle, height - 10, 2*paddle, 10);    

//This rectangle is simply a smaller white version of the previous. 
//I created this to help visualize the hitbox as the hit detection of the 
//ball can be difficult to see with a black paddle. 
  fill(250);
  rect(mouseX - paddle + 10, height - 10, 2*paddle - 20, 4);
  fill(250);
  textSize(15);
  text("hit: " + hit, 10, 20, 40);  //Creates a counter that adds the score after "hit: "
 
  /////////////////////////////////////////////GameOver/////////////////////////////////////////////
  //This piece of code basically states that if the ball misses, then
  //a large text reading "GAME OVER" will be placed over the screen.
  if (miss > 0){
    background(0);  
    textSize(95);
      text("GAME OVER", 10, height/2+20, 40);
    }
    if (miss > 0){                           //here I make it so that the game can't be reset unless
      if (mousePressed){                     //the game is over. Once ove and the mouse has been pressed
      miss = 0;                              //all the variables are reset and the "hit" counter will 
      ballX = 200;                           //begin counting again. 
      ballY = 100;
      speedX = 7;
      speedY = 0;
    }
    }
}
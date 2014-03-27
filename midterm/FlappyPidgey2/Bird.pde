//player class

class Bird
{
  //bird position
  float birdPosX;
  float birdPosY;
  
  float velocity;
  float gravity;
  
  boolean alive;
  
  boolean collision;
  
  float w,h; //width and height
  float xLeft, xRight, yTop, yBottom;
  
  //bird constructor
  Bird( float birdX, float birdY)
  {
    birdPosX = birdX;
    birdPosY = birdY;
    
    w = 50;
    h = 50;
    
    velocity = -5;
    gravity = -0.5f;
    
    alive = true;
    collision = false;
    
    //set the xLeft,xRight,yTop and yBottom 
    xLeft = birdX;
    xRight = birdX + w;
    yTop = birdY;
    yBottom = birdY + h;
    
    rect(birdPosX, birdPosY, w, h);
  }
  
  void die()
  {
    alive = false;
  }
  
  void update()
  {
    rect(birdPosX, birdPosY, w, h);
    
    //automatic fall logic
    velocity += gravity;
    birdPosY -= velocity;
    
    //update the bird's collision box
    xLeft = birdPosX;
    xRight = birdPosX + w;
    yTop = birdPosY;
    yBottom = birdPosY + h;
  }
}



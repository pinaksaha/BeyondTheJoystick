//pipe class
//the pipes that come from the right side of the screen

class Pipe
{
  //Pipe Position
  float pipePosX;
  float pipePosY;
  
  float speed;
  
  float w,h; //width and height
  float xLeft, xRight, yTop, yBottom;
  float xLeft2, xRight2, yTop2, yBottom2;
  
  //Pipe Constructor
  Pipe( float pipeX, float pipeY )
  {
    pipePosX = pipeX;
    pipePosY = pipeY;
    
    w = 125;
    h = 300;
    
    speed = 2;
    
    //set the xLeft,xRight,yTop and yBottom 
    xLeft = pipeX;
    xRight = pipeX + w;
    yTop = pipeY;
    yBottom = pipeY + h;
    
    xLeft2 = pipeX;
    xRight2 = pipeX + w;
    yTop2 = pipeY+500;
    yBottom2 = pipeY+500 + h;
  }
  
  //basic collision logic for upper pipe
  boolean birdCollisionUpperPipe(Bird player) 
  {
    return !(player.xLeft > this.xRight || 
             player.xRight < this.xLeft || 
             player.yTop > this.yBottom || 
             player.yBottom < this.yTop);
  }
  
  //collision logic for lower Pipe
  boolean birdCollisionLowerPipe(Bird player) 
  {
    return !(player.xLeft > this.xRight2 || 
             player.xRight < this.xLeft2 || 
             player.yTop > this.yBottom2 || 
             player.yBottom < this.yTop2);
  }
  
  void update()
  {
    rect(pipePosX, pipePosY, w, h);  
    rect(pipePosX, pipePosY+500, w, h);
    
    pipePosX-=speed;  
    
    //need to keep updating the collision boxes
    xLeft = pipePosX;
    xRight = pipePosX + w;
    yTop = pipePosY;
    yBottom = pipePosY + h; 
    
    xLeft2 = pipePosX;
    xRight2 = pipePosX + w;
    yTop2 = pipePosY+500;
    yBottom2 = pipePosY+500 + h;
  }
}

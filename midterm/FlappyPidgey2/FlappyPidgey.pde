//Flappy bird clone 

Bird player1;
Pipe Pipe1;
Pipe Pipe2;

boolean speedUpCheck;

PFont font;

int timer;
int tempTimer;

void setup()
{
  size(500, 500); //screen size (made to fit with the map)
  background(100, 149, 237); //background color
  
  frameRate(60);
  
  timer = millis(); //reads it in milliseconds
  
  //load the font
  font = loadFont("Tahoma-48.vlw");
  textFont(font, 30);
  
  player1 = new Bird(50,50);
  Pipe1 = new Pipe(600,-200);
  Pipe2 = new Pipe(920,-200);
  
  speedUpCheck = false;
}

void restart()
{
  background(100, 149, 237); //background color
  player1.birdPosX = 50;
  player1.birdPosY = 50;
  
  player1.velocity = -5;
  player1.gravity = -0.5f;
  
  Pipe1.pipePosX = 600;
  Pipe1.pipePosY = -200;
  
  Pipe2.pipePosX = 920;
  Pipe2.pipePosY = -200;
  
  player1.alive = true;
  
  speedUpCheck = false;
}

//---------------------------------------------
//SOUND SENSOR CODE GOES SOMEWHERE AROUND HERE
void keyPressed()
{
  if( key == ' ' && player1.alive)
  {
    player1.velocity = 10;
  }
  else if( key == ' ' && !player1.alive)
  {
    restart();
  }
  
  if( key == 'v' && !speedUpCheck)
  {
    speedUpCheck = true;
  }
}

//----------------------------------------------

void update()
{
  //border top
  if ( player1.birdPosY <= 0 )
  {
    player1.birdPosY = 0;
  }
  
  //border bottom
  if ( player1.birdPosY >= height-player1.h)
  {
    player1.birdPosY = height-player1.h;
    //player1.die();
  }
  
  //left border
  if( Pipe1.pipePosX < 0 - Pipe1.w)
  {
    Pipe1.pipePosX = 500;
    Pipe1.pipePosY = random(-150,-50);
  }
  
  //left border
  if( Pipe2.pipePosX < 0 - Pipe1.w)
  {
    Pipe2.pipePosX = 500;
    Pipe2.pipePosY = random(-150,-50);
  }
  
  if( Pipe1.birdCollisionUpperPipe(player1) || 
      Pipe1.birdCollisionLowerPipe(player1) ||
      Pipe2.birdCollisionUpperPipe(player1) ||
      Pipe2.birdCollisionLowerPipe(player1) )
  {
    player1.die();
  }
}

void draw()
{ 
  tempTimer = millis() - timer;
  if( player1.alive )
  {
    background(100, 149, 237); //redraw background
    update();
    
    if( speedUpCheck )
    {
      tempTimer = millis() - timer;
      
      Pipe1.speedUp(tempTimer);
      Pipe2.speedUp(tempTimer);
    }
    else
    {
       timer = millis(); //restart timer
       speedUpCheck = false;
    }
    
    Pipe1.update();
    Pipe2.update();
    player1.update();
  }
  
  else
  {
    //display game over message
    text("Press to Restart", width/2-100, height/2);
  }
  
  text("Press Space", 10, 50);
}

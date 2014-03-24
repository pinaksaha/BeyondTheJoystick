//Flappy bird clone 

Bird player1;
Pipe Pipe1;
Pipe Pipe2;

PFont font;

void setup()
{
  size(500, 500); //screen size (made to fit with the map)
  background(100, 149, 237); //background color
  
  frameRate(60);
  
  //load the font
  font = loadFont("Tahoma-48.vlw");
  textFont(font, 30);
  
  player1 = new Bird(50,50);
  Pipe1 = new Pipe(600,-200);
  Pipe2 = new Pipe(920,-200);
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
}

//---------------------------------------------
//SOUND SENSOR CODE GOES SOMEWHERE AROUND HERE
void keyPressed()
{
  if( key == ' ' && player1.alive)
  {
    player1.velocity = 10;
  }
  else
  {
    restart();
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
  if( player1.alive )
  {
    background(100, 149, 237); //redraw background
    update();
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

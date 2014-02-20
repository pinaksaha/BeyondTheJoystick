/*

  Pinak Saha & Noah Schnoll
  Soda Drums
  CS 92923 G Beyond the Joystick
  Spring 2014
  Homework # 2

*/

import processing.serial.*;

Serial myConnection;
int val;

PFont HelveticaNeueLight;
PFont HelveticaNeueBold;
int score = 0;
void setup()
{
  
  size(1280,800);
  background(#f1c40f);
  
  String portName = Serial.list()[2];
  myConnection = new Serial(this, portName, 9600);
  
  HelveticaNeueLight = loadFont("HelveticaNeue-Light-48.vlw");
  HelveticaNeueBold = loadFont("HelveticaNeue-Bold-48.vlw");
  
  textFont(HelveticaNeueBold,48);
  text("Soda Drums",500,100);
  
  //   x1,y1,x2,y2
  rect(400, 200, 500, 500, 7);
  
}
void delay(int delay)
{
  int time = millis();
  while(millis() - time <= delay);
}

void draw()
{
  
  
  fill(#ffffff);
  rect(575, 375, 150, 150, 7);
  
  int number = round(random(0,1));
  fill(#34495e);
  textFont(HelveticaNeueLight,48);
  text(number,640,470);
  
  if(myConnection.available()>0)
  {
     val = myConnection.read();
     println( val + " => " + number);
     
     if(val == number)
     {
       fill(#f1c40f);
       rect(955, 100, 200, 200);
       score = score + 1;
       fill(#ffffff);
       textFont(HelveticaNeueLight,32);
       text("Score:",1000,200);
       text(score,1100,200);
     }
     
     
     delay(750);
     
  }
}



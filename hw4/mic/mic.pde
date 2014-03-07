import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
import processing.serial.*;

Serial myConnection;
int value =0;
Minim bagPipe;
AudioPlayer bagPipePlayer;

void delay(int delay)
{
  int time = millis();
  while(millis() - time <= delay);
}

void setup()
{
  size(400,400);
  
  bagPipe = new Minim(this);
  bagPipePlayer = bagPipe.loadFile("bag.mp3",10240);
  
  String portName = Serial.list()[2];
  
  myConnection = new Serial(this, portName, 9600);
}

void draw()
{
  
  
  if(myConnection.available()>0)
  {
     value = myConnection.read();
     if(value == 1)
     {
       bagPipePlayer.play();
       delay(1100);
        bagPipePlayer.rewind();
     }
  }
}

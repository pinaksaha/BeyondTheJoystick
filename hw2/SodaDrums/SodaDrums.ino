/*
  Pinak Saha & Noah Schnoll
  Soda Drums
  CS 92923 G Beyond the Joystick
  Spring 2014
  Homework # 2
*/

#include <CapacitiveSensor.h>
#include <CapacitiveSensor.h>

const long threshHold = 700;
CapacitiveSensor   cs_4_2 = CapacitiveSensor(4,2);
CapacitiveSensor   cs_10_8 = CapacitiveSensor(10,8);


void setup()
{
   cs_4_2.set_CS_AutocaL_Millis(0xFFFFFFFF);   // turn off autocalibrate on channel 1 - just as an example
    cs_10_8.set_CS_AutocaL_Millis(0xFFFFFFFF);   // turn off autocalibrate on channel 1 - just as an example
   Serial.begin(9600);
}

void loop()
{
    long start = millis();
    long total1 =  cs_4_2.capacitiveSensor(30);
    long total2 =  cs_10_8.capacitiveSensor(30);
    
    if(total1 >= threshHold)
    {
        Serial.print(0);
        Serial.print("\t");Serial.print(total1);
        Serial.print("\n");
    }
    if(total2 >= threshHold)
    {
        Serial.print(1);
        Serial.print("\t");Serial.print(total2);
        Serial.print("\n");
    }
    
    else
    {
        Serial.print(-1);
        Serial.print("\n");
    }
    
    delay(750);
}

/*
  Pinak Saha & Timothy Sanders
  Chicken game
  CS 92923 G Beyond the Joystick
  Spring 2014
  Homework # 1
*/

const int player1 = 2;
const int player2 = 8;

const int ledPin =3;

int  randNumber = 0;

int player1State = 0;
int player2State = 0;


int player1Score = 0;
int player2Score = 0;


int turn = 0;

void setup() 
{
  
  pinMode(ledPin, OUTPUT);      
  pinMode(player1, INPUT);
  pinMode(player2,INPUT);
  Serial.begin(9600);
   Serial.write("================================\n\n");
  Serial.write("  Welcome to Chicken Lets Start \n\n");
  Serial.write("================================\n\n");
    
}

int getDelay()
{
    return random(0,5000);
}

void start()
{
 
  Serial.write("Get Ready\n\n");
  turn = turn + 1;
      Serial.write("Level:");
      Serial.println(turn);
      Serial.write("\n");
  delay(getDelay());
  digitalWrite(ledPin,HIGH);
  delay(1000);
  Serial.write("\n\n");
  digitalWrite(ledPin,LOW);
  
}

void loop()
{
    start();
    player1State = digitalRead(player1);
    player2State = digitalRead(player2);
    
    if(player1State == HIGH)
    {
      Serial.write("Winner Player 1\n");
      player1Score = player1Score +1;
      Serial.write("Player 1 Score:");
      Serial.println(player1Score);
      
      Serial.write("\n");
      delay(3000);
    }
    
    if(player2State==HIGH)
    {
      Serial.write("Winner Player 2\n");
      player2Score = player2Score +1;
      Serial.write("Player 2 Score:");
      Serial.println(player2Score);
      Serial.write("\n");
      delay(3000);
    }
}


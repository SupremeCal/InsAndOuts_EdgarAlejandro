import processing.serial.*; //import the Serial library
Serial myPort;



Enemy[] enemy = new Enemy[3];

String state = "start";

int x; // variable holding the value from A0
int y; // variable holding the value from A1
int b; // variable holding the value from digital pin 2
int b2;

String portName;
String val;

player play = new player(x,y);

void setup()
{
  size ( 1024, 512 ) ; // window size

  for (int i = 0; i < enemy.length; i++ ) {
    enemy[i] = new Enemy(64);
  }

  // we are opening the port
  myPort = new Serial(this, Serial.list()[2], 9600);
  myPort.bufferUntil('\n');
}

// drawing loop
void draw()
{
  //first state 

  if (state=="start") {
    background(0);
    textAlign(CENTER);
    fill(255);
    textSize(32);
    text("Spaceship", width/2, height/2);
    textSize(16);
    if (b == 1) // check if the button is pressed
    {
      state = "Game";
    }
  }  
  //next state '
  if (state=="Game") {
    background(0, 0, 0) ; // set the fill color to black
    clear() ; // clean the screen

    fill(255) ;

    if (b == 1) // check if the button is pressed
    {
      // draw a larger circle with specified coordinates
      play.display();
      ellipse(x/2 +20, y/2, 10, 20);
    } else
    {
      // we draw a circle with a certain coordinates

      play.display();
    }

    if (b2 == 0) // check if the button is pressed
    {
      // Bullets for the level
      square(x/2, y/2, 20);
    } else
    {
      // we draw a circle with a certain coordinates
      ellipse(x/2, y/2, 25, 25);
    }
    //enemySpawner 

    for (int i = 0; i < enemy.length; i++) {
      enemy[i].ascend();
      enemy[i].display();
      enemy[i].left();
    }
  }
}


// data support from the serial port
void serialEvent( Serial myPort) 
{
  // read the data until the newline n appears
  val = myPort.readStringUntil('\n');

  if (val != null)
  {
    val = trim(val);

    // break up the decimal and new line reading
    int[] vals = int(splitTokens(val, ","));

    // we assign to variables
    x = vals[0];
    y = vals[1] ;
    b = vals[2];
    b2 = vals[3];
  }
}
class Enemy {
  float x;
  float y; 
  float diameter;
  float xspeed;

  Enemy(float pHolder) {
    x = width;
    y = random(height);
    diameter = pHolder;
    xspeed = random(0.5, 2.5);
  }

  void ascend() {
    y = y + random(-2, 2);
    x = x - xspeed;
  }

  void display() {
    stroke(255);

    ellipse(x, y, diameter, diameter);
  }

  void left() {
    if (x<-diameter/2) {
      y= height+diameter/2;
    }
  }
}
//bullet class 

class Bullet {
  float x;
  float y;
  float diameter; 
  float xSpeed;

  Bullet(float Holder) {
    x = width;
    y = height; 
    diameter = Holder;
    xSpeed = random(0.5, 2.5);
  }

  void shoot() {
    y = y + random(-2, 2);
    x = x - xSpeed;
  }

  void display() {
    stroke(255);

    ellipse(x, y, 30, diameter);
  }

  void left() {
    if (x<-diameter/2) {
      y= height+diameter/2;
    }
  }
}

//Player class 

class player {

  player(int x1, int y1) {
    x = x1;
    y = y1;

  }
  void display () {
    ellipse(x/2, y/2, 25, 25);
  }
}

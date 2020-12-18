import processing.serial.*; //import the Serial library
Serial myPort;



Enemy[] enemy = new Enemy[5];

String state = "start";

int x; // variable holding the value from A0
int y; // variable holding the value from A1
int b; // variable holding the value from digital pin 2
int b2;// variable holding the value from digital pin 4 

// bullet location 
int bulletY = y/2;
int bulletX = x/2 ;
int bulletSpd = 0;

String portName;
String val;

player play = new player(x, y);
Shield shield = new Shield (x, y);


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
      shield.display();
    } else
    {
      // we draw a circle with a certain coordinates

      play.display();
    }

    if (b2 == 0) // check if the button is pressed
    {
      // Bullets for the level
      ellipse(x/2, y/2, 25, 25);
      fill(255, 255, 0);
      square(bulletX, bulletY, 20);
      bulletX -= bulletSpd;
      bulletY= y/2;
      bulletSpd= -30;
      if(bulletX < 0 ){
        bulletX=x/2;
        bulletY= y/2;
        bulletSpd = 0;
        
      }
    } else
    {
      // we draw a circle with a certain coordinates
      ellipse(x/2, y/2, 25, 25);
      fill(255, 255, 0);
      square(bulletX, bulletY, 5);
      bulletX = x/2;
      bulletY= y/2;
    }
    //enemySpawner 

    for (int i = 0; i < enemy.length; i++) {
      enemy[i].move();
      enemy[i].display();
      enemy[i].left();
    }
  }
  if (state=="End") {
    background(0);
    textAlign(CENTER);
    fill(255);
    textSize(32);
    text("Game Over", width/2, height/2);
    textSize(16);
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

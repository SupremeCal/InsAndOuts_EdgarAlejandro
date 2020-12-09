import processing.serial.*; //import the Serial library
Serial myPort;

int x; // variable holding the value from A0
int y; // variable holding the value from A1
int b; // variable holding the value from digital pin 2
int b2;

int enemyPosX;
int enemtposY;

String portName;
String val;

void setup()
{
  size ( 1024, 512 ) ; // window size

  // we are opening the port
  myPort = new Serial(this, Serial.list()[2], 9600);
  myPort.bufferUntil('\n');
}

// drawing loop
void draw()
{
  background(0, 0, 0) ; // set the fill color to black
  clear() ; // clean the screen

  fill(255) ;

  if (b == 1) // check if the button is pressed
  {
    // draw a larger circle with specified coordinates
    ellipse(x/2, y/2, 50, 50);
    ellipse(x/2 +20, y/2, 10, 20);
  } else
  {
    // we draw a circle with a certain coordinates
    ellipse(x/2, y/2, 25, 25);
  }
  
  if (b2 == 0) // check if the button is pressed
  {
    // draw a larger circle with specified coordinates
    square(x/2, y/2, 20);
  } else
  {
    // we draw a circle with a certain coordinates
    ellipse(x/2, y/2, 25, 25);
  }
  
  if(frameCount % 60 == 0 ){
  enemy();
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

void enemy(){
  fill(255);
  ellipse(random(0,width),600,20,1);
}

void bullets (){

}

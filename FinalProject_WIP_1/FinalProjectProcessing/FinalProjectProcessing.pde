import processing.serial.*; //imports Serial library from Processing

Serial myPort; // creates object from Serial class
int val=0; // creates variable for data coming from serial port
int val1=0;
int val2=0;


void setup() {
  size(400, 400);

  printArray(Serial.list()); // this line prints the port list to the console
  String portName = Serial.list()[2]; //change the number in the [] for the port you need
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  if ( myPort.available() > 0) { // If data is available,
    val = myPort.read(); // read it and store it in val
    val1 = myPort.read();
    val2 = myPort.read();
    
  }

  //draws an ellipse that grows and shrinks in relation to val
  background(255);
  fill (0);
  ellipse ( val1+ 20, val2+20,20,20);
  println ("X axis "+ val1); //prints to Processing console
  println ("Y axis"+val2);//prints to Processing console
  println ("switch"+val); //prints to Processing console
}

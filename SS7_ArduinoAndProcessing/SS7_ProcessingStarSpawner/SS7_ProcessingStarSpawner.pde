
import processing.serial.*; //imports Serial library from Processing


float r = 0;

Serial myPort; // creates object from Serial class
int val=0; // creates variable for data coming from serial port

void setup() {
  size(400, 400);


  printArray(Serial.list()); // this line prints the port list to the console
  String portName = Serial.list()[2]; //change the number in the [] for the port you need
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  if ( myPort.available() > 0) { // If data is available,
    val = myPort.read(); // read it and store it in val
  }

  //draws an ellipse that grows and shrinks in relation to val
  background(255);
  for (int i = 0; i < 400; i++) {
    float r = random(10);
    fill(0, 57, 255);
    stroke(0, 57, 255);
    ellipse(i, r*4, val, val);
  }
  println (val); //prints to Processing console
}

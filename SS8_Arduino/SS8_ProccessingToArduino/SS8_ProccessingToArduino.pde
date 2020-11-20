///////////////////////////////////////////////////////
/*
DEMO: SENDING DATA FROM PROCESSING TO ARDUINO OVER SERIAL.
 Hover over text to send data to Serial.
 Pair with Arduino demo sketch to control LEDs.
 Note: Be sure to specify correct port number below!
 */
///////////////////////////////////////////////////////


import processing.serial.*;  //import Serial library

Serial myPort;  // create object from Serial class

int [] data= {0,1,2,3};


void setup() {
  size(500, 500); 
  background (255);
  fill(0);
  textSize (22);
  textAlign (CENTER, CENTER);



  //set up Serial communication
  printArray(Serial.list()); // prints port list to the console
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600); //initialize Serial communication at 9600 baud
}

void draw() {
  //text stuff

  //mouse location controls communication to Serial 
  if (mouseY > width/2 && mouseY < height) {  

    text("Pattern", width/2, height/2);
     myPort.write(0); //send a 0
     println ("0");
     delay(500);
     myPort.write(1); //send a 0
     println ("1");
     delay(500);
     myPort.write(3); //send a 0
     println ("3");
     delay(500);
     myPort.write(3); //send a 0
     println ("2");
     
  } else if (mousePressed == true) { //if mouse is on left side of screen
    myPort.write(1);  //write '1' to Serial port
    println("1"); //also print '1' to console
  } else {  //otherwise
    myPort.write(0); //send a 0
    println ("0");
  }
}

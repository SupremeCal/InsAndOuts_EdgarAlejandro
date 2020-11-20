//Receives data over Serial port from Processing to control 2 LEDS
//Hook up LEDs to pins 4 and 8;


byte val; // stores data received from serial port
const int LED1 = 13; 
const int LED2 = 12;
const int LED3 = 11;
const int LED4 = 10;


void setup() {
  pinMode(LED1, OUTPUT); 
  pinMode(LED2, OUTPUT); 
  pinMode(LED3, OUTPUT);
  pinMode(LED4, OUTPUT); 
  Serial.begin(9600); 
}

void loop() {
  if (Serial.available()) { // If data is available to read
    val = Serial.read(); // read it and store it in val
  }
  if (val == 0) { // If 0 received
    digitalWrite(LED1, LOW); // turn LEDs off
    digitalWrite(LED2, LOW);
    digitalWrite(LED3, LOW);
    digitalWrite(LED4, LOW);
  }
  else if (val == 1) { // If 1 received
    digitalWrite(LED1, HIGH); // turn the LED at pin 1 on
    digitalWrite(LED2, HIGH);
    digitalWrite(LED3, HIGH);
    digitalWrite(LED4, HIGH);// other LED off

  }
  else if (val == 2) { // If 2 received
    digitalWrite(LED2, LOW); // turn the LED at pin 2 on
    digitalWrite(LED1, LOW); //other LED off]
    
    digitalWrite(LED3, LOW); // turn the LED at pin 2 on
    digitalWrite(LED4, HIGH);
  }
    else if (val == 3) { // If 2 received
    digitalWrite(LED2, HIGH); 
    digitalWrite(LED1, LOW);
    
    digitalWrite(LED3, LOW);
    digitalWrite(LED4, HIGH);
  }
  delay(10); // Wait 10 milliseconds
}

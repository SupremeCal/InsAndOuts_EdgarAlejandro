// Arduino pin numbers

int xVal = 0;
int yVal = 0;
int bVal = 0;
int bVal2 = 0;

void setup() {
  Serial.begin(9600) ; // Open the serial port
  pinMode(2, INPUT) ; 
  pinMode(4, INPUT) ;
  digitalWrite(2, HIGH);
  digitalWrite(4, HIGH);
 
}

void loop() {
  // Read analog port values A0 and A1
  xVal = analogRead(A0);
  yVal = analogRead(A1);

  // Read the logic value on pin 2
  bVal = digitalRead(2);
  bVal2 = digitalRead(4);

  // We display our data separated by a comma
  Serial.print(xVal, DEC);
  Serial.print(",");
  Serial.print(yVal, DEC);
  Serial.print(",");
  Serial.print(!bVal);
  Serial.print(",");
  Serial.print(!bVal2);
  // We end with a newline character to facilitate subsequent analysis
  Serial.print("\n");

  // Small delay before the next measurement
  delay(10);
}

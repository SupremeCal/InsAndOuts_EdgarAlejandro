// Arduino pin numbers

const int SW_pin = 2; // digital pin connected to switch output
const int X_pin = A0; // analog pin connected to X output
const int Y_pin = A1; // analog pin connected to Y output
int val = 0;
int val1 = 0;
int val2 = 0;

void setup() {
  pinMode(SW_pin, INPUT);
  pinMode(X_pin, INPUT);
  pinMode(Y_pin, INPUT);

  digitalWrite(SW_pin, HIGH);
  Serial.begin(9600);
}

void loop() {
  val = digitalRead(SW_pin);
  val = val / 4;

  val1 = analogRead(X_pin);
  val1 = val1 / 4;

  val2 = analogRead(Y_pin);
  val2 = val2 / 4;

  delay(100);
  /*
    Serial.print("Switch:  ");
    Serial.print(digitalRead(SW_pin));
    Serial.print("\n");
    Serial.print("X-axis: ");
    Serial.print(analogRead(X_pin));
    Serial.print("\n");
    Serial.print("Y-axis: ");
    Serial.println(analogRead(Y_pin));
    Serial.print("\n\n");
    delay(100);
  */
  Serial.write(val1);  //to send binary data to Processing
  Serial.write(val2);  //to send binary data to Processing
}

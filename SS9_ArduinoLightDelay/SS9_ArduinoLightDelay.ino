
const int buttonPin = 2;
const int LED =  13;
const int LED1 =  12;
const int LED2 = 11;
const int LED3 = 10;

int buttonState = 0;


void setup() {
  pinMode(LED, OUTPUT);
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
  pinMode(buttonPin, INPUT);
}

// loop runs infinitely
void loop() {
  buttonState = digitalRead(buttonPin);    // read the state of the pushbutton value
  delay (10); //small delay for debouncing, to increase accuracy

  // conditional statement
  if (buttonState == HIGH) { // if button is pressed (voltage received on pin 2)
    digitalWrite(LED, HIGH);
    delay(1000);
    digitalWrite(LED1, HIGH);
    delay(100);
    digitalWrite(LED2, HIGH);
    delay(1000);
    digitalWrite(LED3, HIGH);// send voltage to LED pin
    delay(200);
    digitalWrite(LED, LOW);
    delay(1000);
    digitalWrite(LED1, LOW);
    delay(100);
    digitalWrite(LED2, LOW);
    delay(1000);
    digitalWrite(LED3, LOW);// send voltage to LED pin
    delay(200);
  } else {   //otherwise
    digitalWrite(LED, LOW);
    digitalWrite(LED1, LOW);
    digitalWrite(LED2, LOW);
    digitalWrite(LED3, LOW);// turn off voltage to LED pin
  }
}

#include <Servo.h>
const int servoPin = 9;
Servo servo;

void setup() {
  servo.attach(servoPin);
}

void loop() {
  for(int i=0; i<=180; i++){
    servo.write(i);
    delay(20);
  }
}

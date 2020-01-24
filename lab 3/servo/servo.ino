#include <Servo.h>
const int servoPin = 9;
Servo servo;

void setup() {
  servo.attach(servoPin);
  Serial.begin(115200);
}

void loop() {
  for(int i=0; i<=180; i+=10){
    servo.write(i);
    Serial.println(i);
    delay(500);
  }
}

#include <Wire.h>
#include <Servo.h>

const char keyNone = 'N';
const int keypadAdderss = 10;

Servo bottomServo;
Servo topServo;

int currentValueOfTop;
int currentValueOfBottom;
int rotationStep = 1;

void setup() {
  bottomServo.attach(10);
  topServo.attach(9);
  
  currentValueOfTop = topServo.read();
  currentValueOfBottom = bottomServo.read();
  
  Wire.begin();
}

void loop() {
  Wire.requestFrom(keypadAdderss, 1);
  while (Wire.available()) {
    char key = Wire.read();
    if (key != keyNone) {
      switch(key){
        case 'U':
        {
          if(currentValueOfTop+rotationStep <= 180){
            topServo.write(currentValueOfTop+rotationStep);
            currentValueOfTop+=rotationStep;
            delay(15);
          }
          break;
        }
        case 'D':
        {
          if(currentValueOfTop-rotationStep >= 0){
            topServo.write(currentValueOfTop-rotationStep);
            currentValueOfTop-=rotationStep;
            delay(15);
          }
          break;
        }
        case 'R':
        {
          if(currentValueOfBottom+rotationStep <= 180){
            bottomServo.write(currentValueOfBottom+rotationStep);
            currentValueOfBottom+=rotationStep;
            delay(15);
          }
          break;
        }
        case 'L':
        {
          if(currentValueOfBottom-rotationStep >= 0){
            bottomServo.write(currentValueOfBottom-rotationStep);
            currentValueOfBottom-=rotationStep;
            delay(15);
          }
          break;
        }
      }
    }
  }

}

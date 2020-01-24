import processing.serial.*;

Serial myPortServo;
Serial myPortDist;
PFont myFont;
int xPos = 1;  
float inByte;
int pos;

void setup () {
  size(400, 200);
  println(Serial.list());
  myPortDist = new Serial(this, "COM12", 115200);
  myPortDist.bufferUntil('\n');
  myPortServo = new Serial(this, "COM19", 115200);
  myPortServo.bufferUntil('\n');
  background(255);
  point(200, 199);
}

void draw () {
 /* stroke(0);
   line(xPos, 200, xPos, 199-inByte);
   fill(255);
   rect(10, 40, 80 , 10);
   fill(0, 102, 153);
   text("Pos: " + pos, 10 , 50);
   if (xPos >= width) {
    xPos = 0;
    background(255);
  } else {
    xPos++;
  }*/
  
  
}

void serialEvent(Serial myPortDist) {
  String inString = myPortDist.readStringUntil('\n');
  
 if (inString != null) {
   // убираем любые пробелы:
   inString = trim(inString);
   // конвертируем данные в float
   inByte = float(inString);
   println(inByte);
 }
}

void serialEvent1(Serial myPortServo) {
  String inString = myPortServo.readStringUntil('\n');
  
 if (inString != null) {
   // убираем любые пробелы:
   inString = trim(inString);
   // конвертируем данные в int
   pos = int(inString);
   println(pos);
 }
}

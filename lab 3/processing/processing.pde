import processing.serial.*;

Serial myPortServo;
Serial myPortDist;
PFont myFont;
float dist;
int pos;

void setup () {
  size(400, 200);
  println(Serial.list());
  myPortDist = new Serial(this, "COM12", 115200);
  myPortDist.bufferUntil('\n');
  myPortServo = new Serial(this, "COM19", 115200);
  myPortServo.bufferUntil('\n');
  background(255);
  ellipse(200, 199, 200, 200);
}

void draw () {
  float x = dist * cos(pos);
  float y = dist * sin(pos);
  point(x, y);

 /* stroke(0);
   line(xPos, 200, xPos, 199-inByte);
   fill(255);
   rect(10, 40, 80 , 10);
   fill(0, 102, 153);
   text("Pos: " + pos, 10 , 50);
   
   */
   if (pos >= 180) {
    background(255);
    ellipse(200, 199, 200, 200);
   }
}

void serialEvent(Serial myPortDist) {
  String inString = myPortDist.readStringUntil('\n');
  
 if (inString != null) {
   // убираем любые пробелы:
   inString = trim(inString);
   // конвертируем данные в float
   dist = float(inString);
   println(dist);
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

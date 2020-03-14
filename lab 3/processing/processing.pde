import processing.serial.*;

Serial myPortServo;
Serial myPortDist;
float dist;
int pos;

void setup () {
  size(400, 200);
  println(Serial.list());
  myPortDist = new Serial(this, "COM12", 115200);
  myPortDist.bufferUntil('\n');
  myPortServo = new Serial(this, "COM11", 115200);
  myPortServo.bufferUntil('\n');
  background(255);
  ellipse(200, 0, 400, 400);
}

void draw () {
  
  float x = dist * cos(pos*PI/180);
  float y = dist * sin(pos*PI/180);
  println("x= "+x+" y= "+ y+" dist "+dist+" pos "+ pos);
  point(x+200, y);

 /* stroke(0);
   line(xPos, 200, xPos, 199-inByte);
   fill(255);
   rect(10, 40, 80 , 10);
   fill(0, 102, 153);
   text("Pos: " + pos, 10 , 50);
   
   */
   
}

void serialEvent(Serial thisPort) {
  if (thisPort == myPortDist){
  String inString = myPortDist.readStringUntil('\n');
  
 if (inString != null) {
   // убираем любые пробелы:
   inString = trim(inString);
   // конвертируем данные в float
   dist = float(inString);
   println(dist);
 }
  }
  else{
 String inString = myPortServo.readStringUntil('\n');
  
 if (inString != null) {
   // убираем любые пробелы:
   inString = trim(inString);
   // конвертируем данные в int
   pos = int(inString);
   println(pos);
 }
  }
}

/*void serialEvent1(Serial myPortServo) {
  String inString = myPortServo.readStringUntil('\n');
  
 if (inString != null) {
   // убираем любые пробелы:
   inString = trim(inString);
   // конвертируем данные в int
   pos = int(inString);
   println(pos);
 }
}*/

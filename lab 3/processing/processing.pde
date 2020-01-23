import processing.serial.*;

Serial myPort;
int xPos = 1;  

void setup () {
  size(400, 300);
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 115200);
  myPort.bufferUntil('\n');
  background(0);
}

void draw () {
  // рисуем линию:
   stroke(127,34,255);
   line(xPos, height, xPos, height - inByte);
  // чтобы не выхадилоло за край
  if (xPos >= width) {
    xPos = 0;
    background(0);
  } else {
    // increment the horizontal position:
    xPos++;
  }
}

void serialEvent (Serial myPort) {
 String inString = myPort.readStringUntil('\n');
 
 if (inString != null) {
   // убираем любые пробелы:
   inString = trim(inString);
   // конвертируем данные в int и трансформируем их так, чтобы они соответствовали высоте экрана:
   float inByte = float(inString);
   inByte = map(inByte, 0, 1023, 0, height);
 
 }
}

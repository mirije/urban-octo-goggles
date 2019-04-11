/**
 * Simple Read
 * 
 * Read data from the serial port and change the color of a rectangle
 * when a switch connected to a Wiring or Arduino board is pressed and released.
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;

Serial myPort;  // Create object from Serial class
String buf;
int eol = '\n';
int v0, v1, v2;

void setup() 
{
  size(200, 200);
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  myPort.clear();
}

void draw()
{
  if ( myPort.available() > 0) {
    buf = myPort.readStringUntil(eol);     
    myPort.clear();
    if (buf!=null){
      buf = buf.trim();
      int vals[] = int(split(buf, " "));
    try {
      background(vals[0]/4, vals[1]/4, vals[2]/4);
    }
    catch (ArrayIndexOutOfBoundsException e) {
      return;
    }
    //background(vals[0]>>2, vals[1]>>2, vals[2]>>2);
    background(vals[0], vals[1], vals[2]);
  }
  }
}

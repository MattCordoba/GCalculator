/**
* Quick processing test script for the serial port connection
* graphs a simple version of y=x once a connection is received from
* the microcontroller
*
* CHANGE LATER
*
*/
import processing.serial.*;
int xstart, xstop, xmax;
Serial myPort;
    void setup()
    {
      // List all the available serial ports:
      println(Serial.list());
      // Open the port you are using at the rate you want:
      //myPort = new Serial(this, Serial.list()[0], 19200);
      size (600, 600);
      strokeWeight(2);
      stroke(0);
      xstart = 0;//width/2;
      xstop = 50;//width/2;
      xmax = 600;
    }

    void draw()
    {
      background(255);
      for( int x= xstart; x < xmax; x++ ){
        point (x, height-x);    
      }
      if( xmax < xstop ){
        xmax++;
      }
    }

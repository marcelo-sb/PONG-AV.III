import processing.serial.*;
Serial myPort;  // Create object from Serial class
String up;
float myval;

int ypos = 350;

void setup(){
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  
  size(700,700);
  background(0);
  
  }
  
  void draw(){
    background(0);
    
    fill(250, 0, 0);
    ellipse (350, 350, 50, 50);
    
    fill(255, 255, 255);
    rect(20, ypos, 30, 100);
    
    up = myPort.readStringUntil('\n');
    if(up != null) myval = float(up);
    
    if(myval == 1){
      if(ypos > 0) ypos -= 8;
    }
    if(myval == -1){
     if(ypos < 600) ypos += 8; 
    }
    if(up != null) println(myval);
    
  }

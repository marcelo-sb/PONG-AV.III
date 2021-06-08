import processing.serial.*;
Serial myPort;  // Create object from Serial class
String up;
float myval;

boolean right=true, down=true;

int ypos = 350;
int bally=350, ballx=350;

void setup(){
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  
  size(700,700);
  background(0);
  
  }
  
  void draw(){
    background(0);
    
    fill(250, 0, 0);
    ellipse (ballx, bally, 50, 50);
    
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
    
    if(right){
      ballx += 6;
    }
    else{
      ballx -= 6;
    }
    if(down){
      bally += 3;
    }
    else{
      bally -= 3;
    }
    
    if(ballx >= 700){
      right = false;
    }
    if(ballx <= 0){
      right = true;
    }
    if(bally >= 700){
      down = false;
    }
    if(bally <= 0){
      down = true;
    }
    
    if(ballx <= 60 && bally > ypos && bally < (ypos + 100)){
      right = true;
    }
    
  }

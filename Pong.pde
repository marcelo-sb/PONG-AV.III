import processing.serial.*;
Serial myPort;  // Create object from Serial class
String up, up2;
float myval, myval2, downvel = 1;

boolean right=true, down=true;

int ypos1 = 350, ypos2 = 350;
int bally=350, ballx=350;
int vel = 1;

int pontos1 = 0, pontos2 = 0;
PFont font;

void setup(){
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  
  font = loadFont("Arial-BoldMT-48.vlw");
  
  size(700,700);
  background(0);
  
  }
  
  void draw(){
    background(0);
    
    textSize(60);
    text(pontos1, 200, 80);
    text(pontos2, 450, 80);
    
    up = myPort.readStringUntil(' ');
    if(up != null)myval = float(up);
    up2 = myPort.readStringUntil('\n');
    if(up2 != null)myval2 = float(up2);
    
    fill(250, 0, 0);
    ellipse (ballx, bally, 50, 50);
    
    fill(255, 255, 255);
    rect(20, ypos1, 30, 100);
    
    fill(255, 255, 255);
    rect(650, ypos2, 30, 100);
    
    
    if(myval == 20 || myval == 20){
      exit();
    }
    
    if(myval == 30 || myval == 30){
      ballx = 350;
      bally = 350;
      right = true;
      down = true;
      ypos1 = 350;
      ypos2 = 350;
      pontos1 = 0;
      pontos2 = 0;
      vel=0;
    }
    
    if(myval == 1){
      if(ypos1 > 0) ypos1 -= 8;
    }
    if(myval == -1){
     if(ypos1 < 600) ypos1 += 8; 
    }
      
    if(myval2 == 1){
      if(ypos2 > 0) ypos2 -= 8;
    }
    
    if(myval2 == -1){
      if(ypos2 < 600) ypos2 += 8;
    }
    
    println(dist(ypos1, 255, ballx, bally)/100);
    
    if(right){
      ballx += 6 + vel;
    }
    else{
      ballx -= 6 + vel;
    }
    if(down){
      bally += (3 + vel/2)*downvel;
    }
    else{
      bally -= (3 + vel/2)*downvel;
    }
    
    if(ballx >= 700){
      pontos1++;
      ballx = 350;
      bally = 350;
      right = false;
      vel=0;
      downvel=1;
    }
    if(ballx <= 0){
      pontos2++;
      ballx = 350;
      bally = 350;
      right = true;
      vel=0;
      downvel=1;
    }
    if(bally >= 700){
      down = false;
    }
    if(bally <= 0){
      down = true;
    }
    
    if(ballx <= 70 && bally > ypos1 && bally < (ypos1 + 100)){
      if(!right){
        if(bally < ypos1+12.5 || bally > ypos1 + 87.5)downvel = 2;
        else if(bally < ypos1+25 || bally > ypos1 + 75)downvel = 1.5;
        else if(bally < ypos1 + 37.5 || bally > ypos1 + 62.5)downvel = 1;
        else downvel = 0;
        vel++;
      }
      if(bally>(ypos1+50))down=true;
      else down=false;
      right = true;
    }
    
    if(ballx >= 630 && bally > ypos2 && bally < (ypos2 + 100)){
      if(right){
        if(bally < ypos2+12.5 || bally > ypos2 + 87.5)downvel = 2;
        else if(bally < ypos2+25 || bally > ypos2 + 75)downvel = 1.5;
        else if(bally < ypos2 + 37.5 || bally > ypos2 + 62.5)downvel = 1;
        else downvel = 0;
        vel++;
      }
      if(bally>(ypos2+50))down=true;
      else down=false;
      right = false;
    }
    
  }

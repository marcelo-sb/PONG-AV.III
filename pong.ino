int pos, read1, last;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  read1 = analogRead(A0); 
  if(read1 > last){
    pos = 1;
  }
  else if(read1 < last){
    pos = -1;
  }
  if(read1 > last-10 && read1 < last+10){
    pos = 0;
  }
  last = read1;
  Serial.println(pos);
  delay(100);
}

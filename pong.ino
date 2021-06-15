int pos, read1, last, pos2, read2, last2, read3, read4;

void setup() {
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  pinMode(12, INPUT);
  pinMode(13, INPUT);
  Serial.begin(9600);
}

void loop() {
  read1 = analogRead(A0); 
  read2 = analogRead(A1);
  read3 = digitalRead(12);
  if(read3 == HIGH)Serial.print('2');
  read4 = digitalRead(13);
  if(read4 == HIGH)Serial.print('3');
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
  if(read2 > last2){
    pos2 = 1;
  }
  else if(read2 < last2){
    pos2 = -1;
  }
  if(read2 > last2-10 && read2 < last2+10){
    pos2 = 0;
  }
  last2 = read2;
  Serial.print(pos);
  Serial.print(" ");
  Serial.print(pos2);
  Serial.print("\n");
  delay(100);
}

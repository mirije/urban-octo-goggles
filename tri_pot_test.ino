void setup() {

  Serial.begin(9600);
}

void loop() {
  int v0 = analogRead(A0);
  int v1 = analogRead(A1);
  int v2 = analogRead(A2);
  //float v0 = sensorValue / 1023.0;
  Serial.print(v0>>2); Serial.print(" ");
  Serial.print(v1>>2); Serial.print(" ");
  Serial.println(v2>>2);
  delay(50);
}

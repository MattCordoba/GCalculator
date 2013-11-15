
/**
 * Test Arduino program to ensure valid connection over serial port
 * @author: Matt Cordoba
 */
 
///set baudrate for serial connection
int baud = 19200;
int led =13;
void setup()
{
  Serial.begin(baud);
  pinMode(led, OUTPUT);
}
// the loop routine runs over and over and over and over
void loop()
//loop constantly scans for serial input
{
  //when connection is more than 1 begin if statements
  if (Serial.available() > 0)
  {
    Serial.println(Serial.read());
    digitalWrite(led,HIGH);
    delay(2000);
    digitalWrite(led,LOW);
    //flush the serial value
    Serial.flush();
  }
  delay(2);
}

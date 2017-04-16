const int ledRED = 2; // ERROR
const int ledGREEN = 3; // OK
const int ledBLUE = 4; // CURRENT CONFIGURATION
const int ledYELLOW = 5; // WAITING FOR REPLY
const int button = 13;
const int GPIO9 = 9;

String cmd = "";

//Read a line, waiting until the end
String serialReadLine()
{
  digitalWrite(ledYELLOW, LOW);
  String line = "";
  while(Serial.available() == 0) //Wait for a char
    delay(1);
  char lastChar = Serial.read();
  
  while(lastChar != '\r') //Until the end of the line
  {
    if(lastChar != '\n') //Char \n ignored
      line.concat(lastChar);
    while(Serial.available() == 0)
      delay(1);
    lastChar = Serial.read();
  }
  digitalWrite(ledYELLOW, HIGH);
  
  return line;
}

//End the configuration
void endConf(String error = "no")
{
  digitalWrite(GPIO9, HIGH);
  digitalWrite(ledBLUE, HIGH);
  Serial.end();
  Serial.begin(115200);
  if(error == "no")
  {
    digitalWrite(ledGREEN, LOW);
    Serial.println("Arduino: Cofiguration OK !");
  }
  else
  {
    digitalWrite(ledRED, LOW);
    Serial.println("Arduino /!\\: An error occured, " + error);
  }
  Serial.end();
  
  while(true)
    delay(1000);
}

//Switch on the green led to sgnial that the last step done well
void checkStep()
{
  digitalWrite(ledGREEN, LOW);
  delay(200);
  digitalWrite(ledGREEN, HIGH);
  delay(400);
}


void setup()  {
  pinMode(ledRED, OUTPUT);
  pinMode(ledGREEN, OUTPUT);
  pinMode(ledBLUE, OUTPUT);
  pinMode(ledYELLOW, OUTPUT);
  pinMode(GPIO9, OUTPUT);
  pinMode(button, INPUT);
  
  digitalWrite(ledRED, LOW);
  digitalWrite(ledGREEN, LOW);
  digitalWrite(ledBLUE, LOW);
  digitalWrite(ledYELLOW, LOW);
  
  digitalWrite(GPIO9, HIGH);
  
  Serial.begin(115200);
} 

void loop()  {
  delay(500);
  digitalWrite(ledRED, HIGH);
  digitalWrite(ledGREEN, HIGH);
  digitalWrite(ledBLUE, HIGH);
  digitalWrite(ledYELLOW, HIGH);
  
  while(digitalRead(button)==HIGH) //Waiting for start button. It's time to connect the GPIO9 and power the RN52 !!
    delay(1);
  digitalWrite(ledBLUE, LOW); //Start the configuration
  
  //Enter commande mode
  digitalWrite(GPIO9, LOW); //Switch to commande mode
  cmd = serialReadLine();
  if(cmd != "CMD") //Wait for RN52 switch to commande mode
    endConf("RN52 don't switch to commande mode correctly(" + cmd + ")"); //Error !!
  
  //Configure discovery mask to A2DP
  Serial.println("SD,04");
  cmd = serialReadLine();
  if(cmd.substring(0,3) != "AOK")
    endConf("fail to configure discovery mask to A2DP(" + cmd + ")"); //Error !!
  
  checkStep();
  
  //Configure connection mask to A2DP
  Serial.println("SK,04");
  cmd = serialReadLine();
  if(cmd.substring(0,3) != "AOK")
    endConf("fail to configure connection mask to A2DP(" + cmd + ")"); //Error !!
  
  checkStep();
  
  //Configure device name to SacMultimedia
  Serial.println("SN,SacMultimedia");
  cmd = serialReadLine();
  if(cmd.substring(0,3) != "AOK")
    endConf("fail to configure device name(" + cmd + ")"); //Error !!
  
  checkStep();
  
  //Reboot
  Serial.println("R,1");
  cmd = serialReadLine();
  if(cmd != "reboot")
    endConf("RN52 don't reboot correctly(" + cmd + ")"); //Error !!
  
  endConf(); //End of the configuration
}



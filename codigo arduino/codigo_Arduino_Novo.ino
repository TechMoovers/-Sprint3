#include "DHT.h"
#define dht_type DHT11  //define qual o tipo de sensor DHTxx que se está
/**
* Configurações iniciais sobre os sensores
* DHT11, LM35, LDR5 e TCRT5000
*/
int dht_pin = A1;
DHT dht_1 = DHT(dht_pin, dht_type);  //pode-se configurar diversos
int switch_pin = 2;

int lm35_pin = A0, leitura_lm35 = 0;
float temperatura;


void setup() {
  Serial.begin(9600);
dht_1.begin();
pinMode(switch_pin, INPUT);
}
void loop() {
// put your main code here, to run repeatedly:
float umidade = dht_1.readHumidity();
float temperatura = dht_1.readTemperature();
float umidadeproj2 = umidade * 0.9;
float umidadeproj3 = umidade * 0.98;
float umidadeproj4 = umidade * 1.1;
if (isnan(temperatura) or isnan(umidade)) {
Serial.println("Erro ao ler o DHT");
} else {
Serial.print(umidade);
Serial.print(";");
Serial.print(umidadeproj2);
Serial.print(";");
Serial.print(umidadeproj3);
Serial.print(";");
Serial.print(umidadeproj4);
Serial.print(";");
}
leitura_lm35 = analogRead(lm35_pin);
temperatura = leitura_lm35 * (5.0 / 1023) * 100;
temperatura = 0.37 * temperatura + 0.27;
float temp2 = temperatura * 0.5;
float temp3 = temperatura * 1.25;
float temp4 = temperatura * 1.30;
Serial.print(temperatura);
Serial.print(";");
Serial.print(temp2);
Serial.print(";");
Serial.print(temp3);
Serial.print(";");
Serial.println(temp4);
delay(3000);
}

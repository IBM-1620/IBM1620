* TAF - SDTRL - OSCILLATOR, ONE MC
* https://static.righto.com/sms/TAF.html
* SPICE model of IBM SMS logic card
* Bruce MacKinnon 7-June-2024

.SUBCKT SMS_CARD_TAF a b c d e f g h j k l m n p q r

* Standard aliases for power pins
Rx0 vp12 n 0
Rx1 vn12 m 0

r10 vn12 t3_c 750
* Pull in my approximation of a crystal filter
x1 t3_b t4_c CRYSTAL_1MC
* PNP transistor
* Qx nc nb ne mname 
q3 t3_c t3_b t4_e pnp033
* Clamp diode 
d30 t3_b 0 diodeAS
* Final buffer transistor
q2 d t3_b 0 pnp106
r12 d vn12 430
r31 c 0 360
r11 vp12 t4_e 2k
q4 t4_c 0 t4_e pnp033
* Tuned tank circuit (1.2 MHz)
r9 t4_c vn12 1.8k
l7 t4_c vn12 100u
c5 t4_c vn12 150p
* Big supply bypass
c14 vn12 0 6.8u

.ENDS



* TAJ
* SDTRL - TRIGGER, BINARY
* https://static.righto.com/sms/TAJ.html
* SPICE model of IBM SMS logic card
* Bruce MacKinnon 7-June-2024

.SUBCKT SMS_CARD_TAJ a b c d e f g h j k l m n p q r

* Standard aliases for power/ground pins
Rx0 vp12 n 0
Rx1 vn12 m 0
Rx2 gnd j 0

* Supply bypass
c16 vn12 gnd 6.8u

* D pulse AC and A gate
c19 d 1 150p
r18 a 1 1.3k
* Extra feature 
r34 g a 1.2k
d21 1 t3_b diodeCD

* F pulse AC and E gate
c24 f 3 150p
r22 e 3 1.3k
d23 3 t3_b diodeCD

* Q pulse AC and R gate
c5  q 2 150p
r1  r 2 1.3k
d6  2 t1_b diodeCD

* L pulse AC and K gate
c3  l 4 150p
r2  k 4 1.3k 
d4  4 t1_b diodeCD

* Collector loads (pull down)
r30 vn12 b 680
r14 vn12 p 680 

* Base pull up 
r32 vp12 t3_b 33k
r7  vp12 t1_b 33k

* Emitter calmp diodes
d31 t3_b gnd diodeGS
d11 t1_b gnd diodeGS

* PNP transistors
* Qx nc nb   ne mname 
q3   b  t3_b gnd pnp039
q1   p  t1_b gnd pnp039

* Base-collector cross-link
r10 t3_b p 4.7k
r28 t1_b b 4.7k
c8  t3_b p 33p
c27 t1_b b 33p

* Reset
r33 t3_b h 5.1k
r26 t1_b c 5.1k

.ENDS

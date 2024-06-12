* TAG
* SDTRL-2WAY Inverter
* https://static.righto.com/sms/TAG.html
* SPICE model of IBM SMS logic card
* Bruce MacKinnon 12-June-2024

.SUBCKT SMS_CARD_TAG a b c d e f g h j k l m n p q r

* Standard aliases for power/ground pins
Rx0 vp12 n 0
Rx1 vn12 m 0
Rx2 gnd j 0 

* Bypass cap
c11 vn12 gnd 10u

r20 b t3_b 4.7k
r21 d t3_b 4.7k
r22 vp12 t3_b 18k
r32 vn12 g 1k 
* PNP transistor:
* Qx nc nb   ne mname 
q3   g  t3_b gnd pnp039

r28 e t4_b 4.7k
r29 f t4_b 4.7k
r27 vp12 t4_b 18k
r30 vn12 c 1k 
* PNP transistor:
* Qx nc nb   ne mname 
q4   c  t4_b gnd pnp039

r9 q t2_b 4.7k
r8 r t2_b 4.7k
r6 vp12 t2_b 18k
r13 vn12 k 1k 
* PNP transistor:
* Qx nc nb   ne mname 
q2   k  t2_b gnd pnp039

* IMPORTANT: This circuit has an open collector feature
* between L and P
r1 a t1_b 4.7k
r2 h t1_b 4.7k
r3 vp12 t1_b 18k
r14 vn12 l 1k 
* PNP transistor:
* Qx nc nb   ne mname 
q1   p  t1_b gnd pnp039

.ENDS



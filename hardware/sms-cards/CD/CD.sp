
* CD 
* 3x Three input NAND gate
* https://static.righto.com/images/smsdocs/1410_SMS_VOL_2055.png
* SPICE model of IBM SMS logic card
* Bruce MacKinnon 2-June-2024

.include "../ibm-sms-models.sp"

.SUBCKT SMS_CARD_CD a b c d e f g h j k l m n p q r

* Standard aliases for power pins
Rx0 vp12 n 0
Rx1 vn12 m 0

* -----

R31 vn12 e 1.6k
R23 vp12 t4_b 33k
R21 a t4_b 5.6k
R22 b t4_b 5.6k
R3 k t4_b 5.6k

* PNP transistor
* QXXXXXXX nc nb ne <ns> <tj> mname <area=val> <areac=val>
* + <areab=val> <m=val> <off> <ic=vbe,vce> <temp=val>
* + <dtemp=val>
Qt4 e t4_b 0 pnp033

* -----

R14 vn12 l 1.6k
R13 vp12 t6_b 33k
R15 f t6_b 5.6k
R17 g t6_b 5.6k
R16 h t6_b 5.6k

* PNP transistor
* QXXXXXXX nc nb ne <ns> <tj> mname <area=val> <areac=val>
* + <areab=val> <m=val> <off> <ic=vbe,vce> <temp=val>
* + <dtemp=val>
Qt6 c t6_b 0 pnp033

* -----

R32 vn12 d 1.6k
R26 vp12 t5_b 33k
R8 p t5_b 5.6k
R6 q t5_b 5.6k
R5 r t5_b 5.6k

* PNP transistor
* QXXXXXXX nc nb ne <ns> <tj> mname <area=val> <areac=val>
* + <areab=val> <m=val> <off> <ic=vbe,vce> <temp=val>
* + <dtemp=val>
Qt5 d t5_b 0 pnp033

.ENDS

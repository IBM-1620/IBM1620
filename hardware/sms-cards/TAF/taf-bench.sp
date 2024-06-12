* Generic test bench

.include "../ibm-sms-models.sp"
.include "../ibm-sms-components.sp"
.include "taf.sp"

vs1 vp12 0 12
vs2 vn12 0 -12
* Ground node
ralias0 gnd 0 0 

* Inputs

 vta a 0 -0.1
*            PULSE (V1    V2   TD   TR  TF  PW   PER  NP )
*vta a 0 -0.1 pulse (-0.1 -12.0 100n 10n 10n 100n 400m 0)
vtb b 0 -0.1
*vtb b 0 -0.1 pulse (-0.2 -12.0 250n 10n 10n 100n 400m 0)
*vtc c 0 0 
*vtd d 0 0 
vte e 0 0 
vtf f 0 0 
vtg g 0 0 
vth h 0 0 
vtk k 0 0
vtl l 0 0 
vtp p 0 0 
vtq q 0 0 
vtr r 0 0 

* Jumper wires
rx0 c d 0

* Instantiate the card
X1 a b c d e f g h gnd k l vn12 vp12 p q r SMS_CARD_TAF

* ===== Control Language ======================================================

.control
tran 1000p 50000n
set xbrushwidth=2
plot v(d)
*reset
*dc vin 0 1 0.01              ; simulation command 2
*plot v(out)                  ; v(in) not required because it is the x axis already
*write $inputdir/outdc.out v(out)
.endc

.end

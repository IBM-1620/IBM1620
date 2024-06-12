* Generic test bench

.include "../ibm-sms-models.sp"
.include "../ibm-sms-components.sp"
.include "taj.sp"
.include "../taf/taf.sp"

vs1 vp12 0 12
vs2 vn12 0 -12
rgnd gnd 0 0 

*            PULSE (V1    V2   TD   TR  TF  PW   PER  NP )
* Reset pulse
Vreset1 reset1 0 pulse (0 -12 1000n 50n 50n 1000n 2u 1)
*Vreset1 reset1 0 0 
Vreset2 reset2 0 0

* Reset circuits
* CEYB
rx5 vn12 r0 300
* Emitter follower for reset
* Qx nc   nb     ne    mname 
qr   r0   reset1 r1    pnp033
*lx1 r1 h 51u
rx6 r1 h 30
* CEYB
rx7 vn12 r2 300
* Emitter follower for reset
* Qx nc   nb     ne    mname 
qs   r2   reset2 r3    pnp033
*lx2 r3 c 51u
rx8 r3 c 30

* 1 MHz clock
*Vd d 0 pulse (-6 0 4000n 1n 1n 150n 1u)
*Vq q 0 pulse (-6 0 4000n 1n 1n 150n 1u)

* ==========================================================
* Jumper wires
rx3 taf_c taf_d 0
* Instantiate the card
X0 gnd gnd taf_c taf_d gnd gnd gnd gnd gnd gnd gnd vn12 vp12 gnd gnd gnd SMS_CARD_TAF
* ==========================================================

* Jumper wires
rx0 p r 1
rx1 b a 1

* Unused
Vf f 0 -12
Ve e 0 -12
Vl l 0 -12
Vk k 0 -12

* Instantiate the card
*X1 a b c d e f g h gnd k l vn12 vp12 p q r SMS_CARD_TAJ
X1 a b c taf_c e f g h gnd k l vn12 vp12 p taf_c r SMS_CARD_TAJ

* ===== Control Language ======================================================

.options savecurrents
* http://www.intusoft.com/articles/converg.pdf
.OPTIONS RELTOL=.005
.OPTION ABSTOL=1N VNTOL=1M
*.OPTIONS ITL4=500

* Added to provide an approximate solution for a bistable circuit
* The left transistor (t3) is off initially, the right (t1) is on.
* The left base will be clamped above ground by D31.
* The right base will be 0.2 volts below ground (on).
.nodeset v(b)=-12 v(p)=0

.control
    tran 100p 20u
    plot taf_c b p 
    *plot x1.t3_b b x1.t1_b p
.endc

.end

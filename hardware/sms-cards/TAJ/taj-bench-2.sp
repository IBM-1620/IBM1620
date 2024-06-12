* Generic test bench

.include "../util/ibm-sms-models.sp"
.include "../util/ibm-sms-components.sp"
.include "../TAF/TAF.sp"
.include "../util/hiz.sp"
.include "TAJ.sp"

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

*X_HIZ0 WHIZ0.A SMS_CARD_HIZ
*X_1A15 1A15_A_UNUSED 1A15_B_UNUSED W1A16.D W1A16.D 1A15_E_UNUSED 1A15_F_UNUSED 1A15_G_UNUSED 1A15_H_UNUSED gnd 1A15_K_UNUSED 1A15_L_UNUSED vn12 vp12 1A15_P_UNUSED 1A15_Q_UNUSED 1A15_R_UNUSED SMS_CARD_TAF
*X_1A16 W1A16.A W1A16.A WHIZ0.A W1A16.D 1A16_E_UNUSED 1A16_F_UNUSED 1A16_G_UNUSED 1A16_H_UNUSED gnd 1A16_K_UNUSED 1A16_L_UNUSED vn12 vp12 W1A16.P W1A16.D W1A16.P SMS_CARD_TAJ

X_HIZ0 WHIZ0.A SMS_CARD_HIZ
X_1A16 W1A16.A W1A16.A WHIZ0.A W1A16.D W1A16_E_UNUSED W1A16_F_UNUSED W1A16_G_UNUSED W1A16_H_UNUSED gnd W1A16_K_UNUSED W1A16_L_UNUSED vn12 vp12 W1A16.P W1A16.D W1A16.P SMS_CARD_TAJ
X_1A15 W1A15_A_UNUSED W1A15_B_UNUSED W1A16.D W1A16.D W1A15_E_UNUSED W1A15_F_UNUSED W1A15_G_UNUSED W1A15_H_UNUSED gnd W1A15_K_UNUSED W1A15_L_UNUSED vn12 vp12 W1A15_P_UNUSED W1A15_Q_UNUSED W1A15_R_UNUSED SMS_CARD_TAF

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
*.nodeset v(b)=-12 v(p)=0

.control
    tran 100p 20u
    plot W1A16.D W1A16.A W1A16.P
.endc

.end

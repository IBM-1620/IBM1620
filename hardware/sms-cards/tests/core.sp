* IBM 1620 Test Bench
* IBM 1620 Logic Reproduction Project
*
* We have this in the .spiceinit file:
*
* set sourcepath=( /home/bruce/IBM1620/hardware/sms-cards $sourcepath )
*
* And we have a symbolic link from /home/bruce/IBM1620 to /home/bruce/ibm1620
* so resolve what appears to be a case-sensitivity issue with NGSPICE. 
*
.include "util/ibm-sms-models.sp"
.include "util/ibm-sms-components.sp"
.include "util/sim-components.sp"
.include "TAF/TAF.sp"
.include "TAJ/TAJ.sp"
.include "TAG/TAG.sp"

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

* Card HIZ at location HIZ0 - High Impedance
X_HIZ0 W.HIZ0.A SMS_CARD_HIZ
* Card ONE at location 9991 - Logical 1
X_9991 W.9991.A SMS_CARD_ONE
* Card TAJ at location 1A16 - SDTRL-Trigger, Binary
X_1A16 W.1A16.A W.1A16.A W.HIZ0.A W.1A16.D W.1A16.E W.1A16.F W.1A16.G W.1A16.H gnd W.1A16.K W.1A16.L vn12 vp12 W.1A16.P W.1A16.D W.1A16.P SMS_CARD_TAJ
* Card TAF at location 1A15 - SDTRL-Oscillator, One MC
X_1A15 W.1A15.A W.1A15.B W.1A16.D W.1A16.D W.1A15.E W.1A15.F W.1A15.G W.1A15.H gnd W.1A15.K W.1A15.L vn12 vp12 W.1A15.P W.1A15.Q W.1A15.R SMS_CARD_TAF
* Card TAG at location 1B17 - SDTRL-2Way Inverter
X_1B17 W.9991.A W.1B17.B W.1B17.C W.1B17.D W.9991.A W.1A16.P W.1B17.G W.1A16.A gnd W.1B17.K W.1B17.L vn12 vp12 W.1B17.P W.1B17.Q W.1B17.R SMS_CARD_TAG

* Jumper
rj0 W.1B17.P W.1B17.L 0

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
    tran 100p 5u
    plot W.1A16.D W.1A16.P W.1A16.A
    plot W.1B17.C 
    plot W.1B17.P
.endc

.end

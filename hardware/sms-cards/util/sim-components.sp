* HIZ
* SPICE model of IBM SMS logic card
* Bruce MacKinnon 7-June-2024

.SUBCKT SMS_CARD_HIZ a
r1 a 0 100MEG
.ENDS

.SUBCKT SMS_CARD_ONE a
v1 a 0 -0.2
.ENDS

.SUBCKT SMS_CARD_ZERO a
v1 a 0 -12
.ENDS

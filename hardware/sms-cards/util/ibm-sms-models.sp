
* A germanium transistor model.  No idea if this is similar to the actual
* type 033. The model was taken from an AC128 device.
.MODEL pnp033 PNP(IS=20.66u BF=229.6 BR=14.66 NF=1.133 NR=1.140 
+ VAF=19.68 VAR=88.28 IKF=463.0m IKR=241.5m ISE=2.190u 
+ ISC=7.546u NE=1.796 NC=1.364 RB=1.885 RE=306.4m RC=1.727u)

* A germanium transistor model.  No idea if this is similar to the actual
* type 039. The model was taken from an AC128 device.
.MODEL pnp039 PNP(IS=20.66u BF=229.6 BR=14.66 NF=1.133 NR=1.140 
+ VAF=19.68 VAR=88.28 IKF=463.0m IKR=241.5m ISE=2.190u 
+ ISC=7.546u NE=1.796 NC=1.364 RB=1.885 RE=306.4m RC=1.727u)
*
* A germanium transistor model.  No idea if this is similar to the actual
* type 106. The model was taken from an AC128 device.
.MODEL pnp106 PNP(IS=20.66u BF=229.6 BR=14.66 NF=1.133 NR=1.140 
+ VAF=19.68 VAR=88.28 IKF=463.0m IKR=241.5m ISE=2.190u 
+ ISC=7.546u NE=1.796 NC=1.364 RB=1.885 RE=306.4m RC=1.727u)

* TODO: Figure out the characteristics of these diodes
* NOTE: Adding a realistic capacitance resolves simulation convergence problems
.MODEL diodeAS D(CJO=10p RS=2 TT=10n) 
.MODEL diodeCD D(CJO=10p RS=2 TT=10n)
.MODEL diodeGS D(CJO=10p RS=2 TT=10n) 

.model switch1 sw 

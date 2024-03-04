# CODEBASE
The following project is and adaptation of the SIRD model used in the study of epidemiology dynamics.
The following are the proposed governing equations of the modified SIRD used to analyse the evolution of the COVID-19 pandemic in Italy:
1. St+1 - St = - sc1*St - sv1*St - se1*St*(LIt + 5*HIt) + lv*Vt + c1s*Ct + rr*Rt
2. Vt+1 - Vt = - lv*St - v1cv1*Vt - v1ev*Vt*(LIt + HIt) + sv1*St
3. Ct+1 - Ct = - c1s*Ct - c1cv1*Ct - c1e1*Ct*(LIt + 5*HIt) + sc1*St + cv1c1
4. CVt+1 - CVt = - cv1v1*CVt - cv1ev*CVt + v1cv1*Vt + c1cv1*Ct
5. Et+1 - Et = - e1a1*Et - e1ic1*Et + se1*St*(LIt + 5*HIt) + c1e1*Ct*(LIt + 5*HIt)
6. ICt+1 - ICt = - ic1li1*ICt - ic1hi1*ICt + e1ic1*Et
7. At+1 - At = - a1ica1*At + e1a1*Et
8. ICAt+1 - ICAt = - ica1li1*ICAt - ica1hi1*ICAt + a1ica1*At
9. LIt+1 - LIt = - li1d*LIt - li1r*LIt + ic1li1*ICt + ica1li1*ICAt
10. HIt+1 - HIt = - hi1d*HIt - hi1r*HIt + ic1hi1*ICt + ica1hi1*ICAt
11. EVt+1 - EVt = - evaev*EVt - evicv*EVt + v1ev*Vt*(LIt + HIt) + cv1ev*CVt
12. ICVt+1 - ICVt = - icvni*ICVt + evicv*EVt
13. AEVt+1 - AEVt = - aevni*AEVt + evaev*EVt
14. NIt+1 - NIt = - nid*NIt - nir*NIt + aevni*AEVt + icvni*ICVt
15. Dt+1 - Dt = li1d*LIt + hi1d*HIt + nid*NIt
16. Rt+1 - Rt = - rr*Rt + hi1r*HIt + li1r*LIt + nir*NIt
17. DIt+1 = e1ic1*Et + evicv*EVt
18. DEIt+1 = e1ic1*Et + e1a1*Et + evaev*EVt + evicv*EVt
19. DDt+1 = li1d*LIt + hi1d*HIt + nid*NIt
20. DRt+1 = - rr*Rt + hi1r*HIt + li1r*LIt + nir*NIt

Equations 1-10 deal with the share of the population that has not been exposed to the virus
while vaccinated. The susceptible (S), represents the population that is initially vulnerable to
being infected. The vaccinated (V), represents that part of the population that has been
vaccinated. The confined (C), represents the population currently following any preventive
measures. This can go from simply wearing a mask to experiencing a full lockdown, the
severity of the confinement will depend on the parameters of the equation. The confined and
vaccinated (CV), is that part of the population identified by being both confined and
vaccinated. The exposed (E), represents that part of the population that has been exposed
to the disease. It is also used by the model to divide the population into asymptomatic (A)
and in incubation (IC). The asymptomatic (A), refers to that part of the population that will
never know they are infected or will not get tested and immediately form part of the
asymptomatic in the incubation period (ICA). Therefore, the government has no knowledge
that this group is afflicted by the virus. ICA and IC refer to that share of the population
currently incubating the virus without being tested, and the ones incubating it that have been
or will eventually get tested respectively. From any of the incubation periods, the population
moves to either the highly infectious (HI) or the slightly infectious (LI). The distinction
between these two groups reflects that “probably about 10% of cases lead to 80% of the
spread” (Adam Kucharski, as cited in Kupferschmidt, 2020).

Equations 11-14 deal with the share of the population that has been exposed to the virus
while vaccinated. The exposed vaccinated (EV), highlights the share of the vaccinated
population that has been exposed to the virus. The in incubation and vaccinated (ICV),
refers to the vaccinated population currently in incubation that has or will eventually get
tested. The asymptomatic in incubation and vaccinated (AEV), refers to the vaccinated
population currently in incubation that will not get tested. Eventually, the two incubating
groups move to the non-infectious (NI), which represents the population who is currently
vaccinated and infected by the virus. For the purposes of this paper, it is assumed that these
people can not transmit the disease. However, note that a simple change in the governing equations 
could account for this fact if needed. Following from here, the deceased (D)
accounts for the people that eventually die while the recovered (R) accounts for the ones
that eventually recover from the virus.
Equations 17-20 are not really governing equations for the model, but rather a simple way to
estimate the daily count of infections that the government has counted (DI), the real
estimated number of infections taking into account the asymptomatic (DEI), the daily number
of deceased people (DD), and the daily number of recovered people (DR). The definitions of
all the parameters are found below:

Parameter Meaning
sc1: Susceptible to confined rate 
a1ica1: Asymptomatic/no-test to incubation
sv1: Susceptible to vaccinated rate 
ica1li1: Asymptomatic incubation to low infective rate
se1: Susceptible to exposed rate 
ica1hi1: Asymptomatic incubation to high infective rate
v1cv1: Vaccinated to confined and vaccinated rate
li1d: Low infectious to dead rate
v1ev: Vaccinated to exposed rate 
li1r: Low infectious to recovered rate
lv: Length of vaccine’s useful life 
hi1d: High infectious to deceased rate
c1s: Confined to susceptible rate 
hi1r: High infectious to recovered rate
c1cv1: Confined to confined and vaccinated rate
rr: Immune phase (recovered to susceptible rate)
c1e1: Confined to exposed rate 
evaev: Exposed and vaccinated to asymptomatic/no-test exposed rate
cv1c1: Confined vaccinated to confined rate (usually just lv)
evicv: Exposed and vaccinated to incubation and vaccinated rate
cv1ev: Confined vaccinated to exposed rate
icvni: Incubation to non-infectious rate
e1ic1: Exposed to incubation ratio 
aevni: Asymptomatic, exposed, and vaccinated to non-infective rate
e1a1: Exposed to asymptomatic/no-test ratio
nid: Non-infective to deceased rate
ic1li1: Incubation to low infective rate 
nir: Non-infectious to recovered rate
ic1hi1: Incubation to high infective rate

The key dates are:

2020-03-22 First lockdown.
2020-06-15 Easing of restrictions after the first lockdown.
2020-10-24 Introduction of new measures to tackle the second wave and prevent a spike during the holiday period.
2021-01-31 End of the state of emergency.
2021-03-16 Some provinces are classified as a red zone (tight measures imposed)
2021-07-31 End of the second state of emergency.
2021-12-06 Introduction of the super green pass and improvement of the vaccine.
2023-02-03 End date of the analysis.

Parameter Estimation

During period 1, no parameters are changed and we let the model run organically. 

During period 2, the first lockdown, there is a big inflow of people moving from the susceptible group
to the confined group. Therefore, this restriction acts in such a way that sc1 is found to be
equal to 0.06. It should be noted that sc1 is not set equal to 1 since there is a certain time
lag that should be accounted for. Moreover, drastic changes tend to produce unreliable
results given the extortionate sensitivity of the model.

During period 3, the first lockdown officially ends and restrictions are lifted. Consequently,
c1s is obtained to be equal to 0.009 and sc1 is set to 0. It makes sense that the rate at which
people return back to normality is lower by accounting for minor measures and, in general, a
fear factor. This period also accounts for the improvement of testing wetting e1ic1 equal to
25/100 and e1a1 equal to 75/100.

During period 4, new measures are gradually introduced before and during the Christmas
period. Setting sc1 equal to 0.02 and c1s equal to 0 seems to give a realistic representation
of the original data.

During period 5, there is a new ease of restrictions. It is safe to assume that these
restrictions were more permissive in comparison to period 3, giving c1s to be 0.015 and sc1
to be 0. Moreover, this is the time period when the vaccination campaign started. The
vaccination rate is set to be the average number of vaccinations during that time period
divided by the total population. This gives sv1 and c1v1 equal to 0.001433 rounded up to 6
decimal places.

During period 6, to stop the new curve, some provinces are classified as red zones. This
gives c1s equal to 0 and sc1 equal to 0.05. Furthermore, the new vaccination rates sv1 and
c1v1 here become 0.007569. However, the introduction of new covid variants makes
vaccination less effective so v1ev is set equal to 0.01/tp. This is the first time that we set this
parameter to a value different from 0 since before this time period it had little to no effect.
Tests are assumed to improve giving e1ic1 and evicv to be equal to 40/100 (making e1a1
and evaev equal to 60/100).

During period 7, the ease of restrictions and the new vaccination rates give c1s = 0.03,
sc1 = 0, sv1 = 0.009, and c1v1 = 0.009. A small boost is given to the vaccination rates to
account for the arrival of the vaccine booster.

During period 8, vaccination improves greatly, a new green pass is introduced, and barely
any measures are actually followed. This gives c1s = 0.02, sc1 = 0, v1ev = 1.2/tp,
sv1 = 0.032, and c1v1 = 0.032.

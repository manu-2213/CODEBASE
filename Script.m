% Author: Manuel Teres
% Last Edition: 21/02/2023
% The program gives a visual representation of
% the covid 19 DATA in Italy from 2020-01-31 to 2023-02-03
% It can account for a total of 10 periods
% Introduce parameters
% Population
tp = 59440000; % Initial total population
% Time periods
t1 = 53;
t2 = 137;
t3 = 268;
t4 = 367;
t5 = 411;
t6 = 548;
t7 = 676;
t8 = 800;
t9 = 900;
t10 = 1100;
% S parameters
sc1 = 0; % Susceptible to confined rate
sv1 = 0; % Susceptible to vaccinated rate
se1 = 0.165/tp; % Susceptible to exposed rate
v1cv1 = 0; % Vaccinated to confined and vaccinated rate
v1ev = 0; % Vaccinated to exposed rate
lv = 1/90; % Length of vaccine useful life
c1s = 0; % Confined to succeptible rate
c1cv1 = 0; % Confined to confined and vaccinated rate
c1e1 = 0.001/tp; % Confined to exposed rate
cv1c1 = 0; % Confined vaccinated to confined rate (lv)
cv1ev = 0; % Confined vaccinated to exposed rate
e1ic1 = 5/100; % Exposed to incubation ratio
e1a1 = 95/100; % Exposed to asymptomatic/no-test ratio
ic1li1 = 90/100*1/5.1; % Incubation to low infective rate
ic1hi1 = 10/100*1/5.1; % Incubation to high infective rate
a1ica1 = 1; % Asymptomatic/no-test to incubation
ica1li1 = 90/100*1/5.1; % A incubation to low infective rate
ica1hi1 = 10/100*1/5.1; % A incubation to high infective rate
li1d = 1/100*1/14; % Low infective to dead rate
li1r = 99/100*1/14; % Low infective to recovered rate
hi1d = 1/100*1/14; % High infective to deceased rate
hi1r = 99/100*1/14; % High infective to recovered rate
rr = 1/60; % Immune phase
% EV parameters
evaev = 5/100; % Exposed vaccinated to asymptomatic/no-test exposed rate
evicv = 95/100; % Exposed vaccinated to incubation adn vaccinated rate
icvni = 1/5.1; % Incubation to non-infective rate
aevni = 1/5.1; % Asymptomatic exposed vaccinated to non-infective rate
nid = 0; % Non-infective to deceased rate
nir = 1; % Non-infective to recovered rate
% End of parameters
% Initial conditions
S0 = tp;
V10 = 0;
C10 = 0;
CV10 = 0;
E10 = 0;
IC10 = 0;
A10 = 0;
ICA10 = 0;
LI10 = 16000;
HI10 = 2000;
EV0 = 0;
ICV0 = 0;
AEV0 = 0;
NI0 = 0;
D0 = 0;
R0 = 0;
DI0 = 2;
DEI0 = 0;
DR0 = 0;
DD0 = 0;
% Pre-allocate variables
S = zeros(1,t10+1);
RK = zeros(1,t10+1);
V1 = zeros(1,t10+1);
C1 = zeros(1,t10+1);
CV1 = zeros(1,t10+1);
E1 = zeros(1,t10+1);
IC1 = zeros(1,t10+1);
A1 = zeros(1,t10+1);
ICA1 = zeros(1,t10+1);
LI1 = zeros(1,t10+1);
HI1 = zeros(1,t10+1);
EV = zeros(1,t10+1);
ICV = zeros(1,t10+1);
AEV = zeros(1,t10+1);
NI = zeros(1,t10+1);
D = zeros(1,t10+1);
R = zeros(1,t10+1);
DI = zeros(1,t10+1);
DEI = zeros(1,t10+1);
DR = zeros(1,t10+1);
DD = zeros(1,t10+1);
% End of pre allocation
% Set initial conditions
S(1,1) = S0;
V1(1,1) = V10;
C1(1,1) = C10;
CV1(1,1) = CV10;
E1(1,1) = E10;
IC1(1,1) = IC10;
A1(1,1) = A10;
ICA1(1,1) = ICA10;
LI1(1,1) = LI10;
HI1(1,1) = HI10;
EV(1,1) = EV0;
ICV(1,1) = ICV0;
AEV(1,1) = AEV0;
NI(1,1) = NI0;
D(1,1) = D0;
R(1,1) = R0;
DI(1,1) = DI0;
DEI(1,1) = DEI0;
DR(1,1) = DR0;
DD(1,1) = DD0;
% End of initial conditions
% Iterate over time

% Preventive measures parameters

for j = 1:t10
    if j <= t1

    elseif j <= t2
        % Lockdown
        sc1 = 0.06;

    elseif j <= t3
        % Ease of restrictions
        c1s = 0.009;
        sc1 = 0;

        % Improvement of testing

        e1ic1 = 25/100;
        e1a1 = 75/100;

    elseif j <= t4
        % New measures/Christmas
        c1s = 0;
        sc1 = 0.02;

    elseif j <= t5
        % No restrictions
        c1s = 0.015;
        sc1 = 0;

        % Introduction to the vaccine
        sv1 = 0.001433;
        c1v1 = 0.001433;

    elseif j <= t6
        % Red alert
        c1s = 0;
        sc1 = 0.05;

        % Vaccine
        sv1 = 0.007569;
        c1v1 = 0.007569;
        v1ev = 0.01/tp;

        % Tests
        e1ic1 = 40/100;
        e1a1 = 60/100;
        evaev = 60/100;
        evicv = 40/100;

    elseif j <= t7
        % Ease of restrictions
        c1s = 0.03;
        sc1 = 0;

        % Vaccine
        sv1 = 0.009;
        c1v1 = 0.009;

    elseif j <= t10
        % Introduction of green pass
        c1s = 0.002;
        sc1 = 0;

        % End of measures
        v1ev = 1.2/tp;

        % Vaccine
        sv1 = 0.032;
        c1v1 = 0.032;
    end
    % End of preventive measures

    % Dynamical model
    S(1,j+1) = S(1,j)-sc1*S(1,j)-sv1*S(1,j)-se1*S(1,j)*(LI1(1,j)+5*HI1(1,j))+lv*V1(1,j)+c1s*C1(1,j)+rr*R(1,j);
    V1(1,j+1) = V1(1,j)+sv1*S(1,j)-lv*V1(1,j)-v1cv1*V1(1,j)-v1ev*V1(1,j)*(LI1(1,j)+HI1(1,j));
    C1(1,j+1) = C1(1,j)+sc1*S(1,j)-c1cv1*C1(1,j)+cv1c1*CV1(1,j)-c1e1*C1(1,j)*(LI1(1,j)+5*HI1(1,j))-c1s*C1(1,j);
    CV1(1,j+1) = CV1(1,j)+v1cv1*V1(1,j)+c1cv1*C1(1,j)-cv1c1*CV1(1,j)-cv1ev*CV1(1,j);
    E1(1,j+1) = E1(1,j)+se1*S(1,j)*(LI1(1,j)+5*HI1(1,j))+c1e1*C1(1,j)*(LI1(1,j)+5*HI1(1,j))-e1a1*E1(1,j)-e1ic1*E1(1,j);
    IC1(1,j+1) = IC1(1,j)+e1ic1*E1(1,j)-ic1li1*IC1(1,j)-ic1hi1*IC1(1,j);
    A1(1,j+1) = A1(1,j)+e1a1*E1(1,j)-a1ica1*A1(1,j);
    ICA1(1,j+1) = ICA1(1,j)-ica1li1*ICA1(1,j)-ica1hi1*ICA1(1,j)+a1ica1*A1(1,j);
    LI1(1,j+1) = LI1(1,j)+ic1li1*IC1(1,j)+ica1li1*ICA1(1,j)-li1d*LI1(1,j)-li1r*LI1(1,j);
    HI1(1,j+1) = HI1(1,j)+ic1hi1*IC1(1,j)+ica1hi1*ICA1(1,j)-hi1d*HI1(1,j)-hi1r*HI1(1,j);
    EV(1,j+1) = EV(1,j)+cv1ev*CV1(1,j)+v1ev*V1(1,j)*(LI1(1,j)+HI1(1,j))-evaev*EV(1,j)-evicv*EV(1,j);
    ICV(1,j+1) = ICV(1,j)+evicv*EV(1,j)-icvni*ICV(1,j);
    AEV(1,j+1) = AEV(1,j+1)+evaev*EV(1,j)-aevni*AEV(1,j+1);
    NI(1,j+1) = NI(1,j)+aevni*AEV(1,j+1)+icvni*ICV(1,j)-nid*NI(1,j)-nir*NI(1,j);
    D(1,j+1) = D(1,j)+li1d*LI1(1,j)+hi1d*LI1(1,j)+nid*NI(1,j);
    R(1,j+1) = R(1,j)+li1r*LI1(1,j)+hi1r*LI1(1,j)+nir*NI(1,j)-rr*R(1,j);
    DI(1,j+1) = evicv*EV(1,j)+e1ic1*E1(1,j);
    DEI(1,j+1) = evicv*EV(1,j)+e1ic1*E1(1,j)+evaev*EV(1,j)+e1a1*E1(1,j);
    DD(1,j+1) = li1d*LI1(1,j)+hi1d*HI1(1,j)+nid*NI(1,j);
    DR(1,j+1) = li1r*LI1(1,j)+hi1r*LI1(1,j)+nir*NI(1,j);
    % End of dynamical model
end
% End of iteration
% Plotting
rawTable = readtable('ItalyData.xlsx');
x = rawTable.days; %: get the excel column
y = rawTable.new_cases; %: get the excel column
z = rawTable.new_deaths; %: get the excel column
figure;
figure(1)
plot(1:t10+1,DI,'r-',1:t10+1,y(1:t10+1),'b-');
xlabel('Days');ylabel('Infections');
legend('Model Daily Infections', 'Reported Daily Infections');
title('Model Daily Infections vs Reality')
figure(2)
plot(1:t10+1,DEI,'r-',1:t10+1,y(1:t10+1),'b-');
xlabel('Days');ylabel('Infections');
legend('Model Daily Expected Infections','Reported Daily Infections');
title('Model Daily Expected Infections vs Reality')
figure(3)
plot(1:t10+1,DD,'r-',1:t10+1,z(1:t10+1),'b-');
xlabel('Days');ylabel('Deceased');
legend('Model Daily Expected Deceased','Reported Daily Deceased');
title('Model Daily Expected Deceased vs Reality')

      


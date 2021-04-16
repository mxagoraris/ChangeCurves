%%Main code

clear all;
T = readtable("data.xlsx"); 

r = T.ForwardRates;
Forward.rates = r;
%firstly we create a struct called fwd which has the values of a forward
%curve

Forward.compounding =1 ; %actually this is contains the compounding periods per year
%if it is 2 then we have 6 month compounding

Forward.Period=1/Forward.compounding; %this variable contains the starting period for our forward rates
Forward.years=length(r)/Forward.compounding; %this variable contains the number of the years 
Forward.tenors=[1/Forward.compounding:1/Forward.compounding:Forward.years];
Forward.VR=0*Forward.tenors;
Forward.start = 0*r;
Forward.type = "spot";
Spot.compounding=1; 

numofspot =Forward.years-mod(Forward.years,Spot.compounding);
Spot.years = numofspot/Spot.compounding;
Spot.rates=zeros(Spot.years-mod(Spot.years,Spot.compounding),1);
%we have as many spot rates as the years that can be covered from our fwd
%curve

Spot.tenors=[1/Spot.compounding:1/Spot.compounding:Forward.years];
%we call a function to calculate our Spot rates given our FWD and SpotCurve
%struct

Spot = Fwd2SpotCurve(Forward,Spot);
Spot.VR;

if isempty(Spot.rates)
    disp("Spot Rate cannot be calculated")
else
   SpotRatesfromFWD = Spot.rates 
end

SRCurve=Forward; %we create a SRCurve struct, in this case it contains 
%the values of our fwd curve for simplification reasons. It could contain
%whatever we want
SRCurve.rates = T.SwapRates;
SRCurve.type = "annuity"; %we change the type of the curve

%Using the bootstrapping method we calculate from SwapRates our Spot Rates
SRCurve=SpotCurveFromSwapCurve(SRCurve);
SpotRatesfromSR = SRCurve.SpotRates

%Now we are taking a sample Bondportfolio so as to calculate its forward
%value given a forward period

Bondportfolio.CpnRate= [1/100; 2.5/100; 2/100; 1.8/100; 2.2/100];
Bondportfolio.CpnPeriod = [1; 1; 1; 1; 1];
Bondportfolio.FVs = [200; 100; 100; 200; 200];
Bondportfolio.Maturities = [3; 2; 1; 1; 4];
Bondportfolio.t=2; %forward year to start (here we can put a number >=1) 
[Bondportfolio] = PriceBondPortfolio(Bondportfolio,Forward);
Bondportfolio.PPrice
%Function that calculates individual Spot rates given Forward rates
function Spot = SpotRatesCalculation(Spot,Forward)
for i=1:length(Spot.rates)
Spot.rates(i)=Spot.VR(i*Forward.compounding*Spot.compounding)^(1/Forward.tenors(i*Forward.compounding*Spot.compounding))-1;
end
end
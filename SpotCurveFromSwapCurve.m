%Function that takes Swap Curve and returns Spot Curve
function [SRCurve]=SpotCurveFromSwapCurve(SRCurve)
%we predifine our variables
ending= length(SRCurve.rates);
DiscountFactors=zeros(ending,1);
DiscountFactors(1)=1/(1+SRCurve.rates(1)*SRCurve.Period);
A = zeros(ending,1);
%knowing the first value of the 
A(1)= DiscountFactors(1)*SRCurve.Period;
SRCurve.SpotRates=zeros(ending,1);
SRCurve.SpotRates(1)=((1/DiscountFactors(1))^(1/(SRCurve.compounding*SRCurve.tenors(1)))-1)*SRCurve.compounding;
for i=2:ending
 [DiscountFactors,A] = DFSandAnnuityforSR(DiscountFactors,SRCurve,A,i);
 SRCurve = SpotRateoffSwapRate(DiscountFactors,SRCurve,i);
end
end
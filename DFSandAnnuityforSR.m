%Function that calculates the discount factors and the annuity for every period
function [DiscountFactors,Annuity] = DFSandAnnuityforSR(DiscountFactors,SRCurve,Annuity,i)
DiscountFactors(i)=(1-SRCurve.rates(i)*Annuity(i-1))/(1+SRCurve.rates(i)*SRCurve.Period);
Annuity(i)=sum(DiscountFactors(1:i))*SRCurve.Period;
end
%Function that calculates spot value relatives given forward curve and value relatives
function [Forward,Spot] = CalculateSpotVRs(Forward,Spot)
Spot.VR=0*Forward.tenors; %a variable that stores spot value relatives
for i=1:length(Forward.tenors)
    %we calculate the value relative for a forward rate using a function
   Forward.VR(i)=FwdRate2ValueRelative(Forward.rates,Forward.tenors, Forward.compounding,i);
   if i==1
       Spot.VR(i)= Forward.VR(i); %FWDVR(1) = SpotVR(1)
   else
       Spot.VR(i)=Spot.VR(i-1)* Forward.VR(i); %V(0,i) = V(0,i-1)*VR(i-1,i)
   end
end
end
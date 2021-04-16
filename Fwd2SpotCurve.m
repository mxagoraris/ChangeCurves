%This function creates a spot curve given a forward curve
function Spot = Fwd2SpotCurve(Forward, Spot)
[Forward,Spot] = CalculateSpotVRs(Forward,Spot);
Spot = SpotRatesCalculation(Spot,Forward);
end
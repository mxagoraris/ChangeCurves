%Function that calculates individual Swap Rates given SR discount factors
function SRCurve = SpotRateoffSwapRate(DiscountFactors,SRCurve,i)
SRCurve.SpotRates(i)=((1/DiscountFactors(i))^(1/(SRCurve.compounding*SRCurve.tenors(i)))-1)*SRCurve.compounding;
end
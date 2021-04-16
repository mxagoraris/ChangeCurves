function [Price,CashflowTimes,Cashflows]=BondPriceOffForwardCurve(Bondportfolio,FWD,i)
if Bondportfolio.Maturities(i)<=Bondportfolio.t
    %we are doing this distinction because in this case we cannot calculate
    %forward prices and cashflows and there are no CashFlowTimes as well
    Price=0;
    Cashflows=0;
    CashflowTimes =0;
else
    CashflowTimes = [Bondportfolio.Maturities(i):-Bondportfolio.CpnPeriod(i):Bondportfolio.t]';
    %We calculate our CashflowTimes using the maturity of the bond minus every
    %time the coupon period until it gets to the t which is the forward year
    
    CashflowTimes = flip(CashflowTimes);
    Cashflows = CashflowTimes*0 + Bondportfolio.CpnRate(i)*Bondportfolio.CpnPeriod(i)*Bondportfolio.FVs(i);
    Cashflows(end) = Cashflows(end) + Bondportfolio.FVs(i);
    r_onCashflowTimes = interp1(FWD.tenors,FWD.rates,CashflowTimes,"pchip");
    %Price is used as a sum variable of the CashFlows for its period
    %As we have forward rates, in order to valuate our bonds we have to
    %discount from the last year to the previous and then add it with that
    %cashflow.
    
    Price=Cashflows(end)*(1/(1+r_onCashflowTimes(length(Cashflows))/Bondportfolio.CpnPeriod(i)));
    start = length(CashflowTimes); 
    %we are calculating the start of the loop like this because we want it
    %to start a discount period before the end as it is predifined
    
        step = -Bondportfolio.CpnPeriod(i);
    %step equals to the cpnperiod if the coupon period is bigger than one
    
        endofloop = Bondportfolio.t+Bondportfolio.CpnPeriod(i);
    %we define this value to the endofloop because we want to discount and
    %add only the CashFlows after the forwardStartPeriod (BondPortfolio.t
    %in our case)
    
    for j=start:step:endofloop
        Price=Price+Cashflows(j-1)*(1/(1+r_onCashflowTimes(j-1)/Bondportfolio.CpnPeriod(i)));
        Cashflows(j-1)=Cashflows(j-1)+Price;
    end
end
end
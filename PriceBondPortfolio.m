%Bondportfolio 
function [Bondportfolio] = PriceBondPortfolio(Bondportfolio,FWD)
numOfBonds = length(Bondportfolio.FVs);
Bondportfolio.Prices = zeros(numOfBonds,1);
Bondportfolio.YtMs = zeros(numOfBonds,1); 
PCashflowTimes=[];
PCashflows=[];
for i=1:numOfBonds
    [Bondportfolio.Prices(i), CashflowTimes, Cashflows] = BondPriceOffForwardCurve(Bondportfolio,FWD,i);
    PCashflowTimesOld = PCashflowTimes;
    PCashflowTimes = union(PCashflowTimes, CashflowTimes);
    if i==1
        PCashflows = Cashflows;
    else
        PCashflowsOld = PCashflows;
        PCashflowsNew = 0*PCashflowTimes;
        [~, ia, ~]=intersect(PCashflowTimes, PCashflowTimesOld);
        [~, ib, ~]=intersect(PCashflowTimes, CashflowTimes);
        PCashflowsNew(ia) = PCashflowsOld;
        PCashflowsNew(ib) = PCashflowsNew(ib)+Cashflows;
        PCashflows = PCashflowsNew;
    end
end
Bondportfolio.PPrice = sum(Bondportfolio.Prices);
end
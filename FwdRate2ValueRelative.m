%Function that calculates forward value relatives
function ValueRelative = FwdRate2ValueRelative(rates,times,m,i)
if m == inf
    ValueRelative = exp(rates*times(i));
else
    ValueRelative = (1+rates(i)/m)^m;
end
end
# Change Curves

This code takes as a given a Forward Curve and it calculates the Spot Curve that derives from it.
This code takes as a given a Par Curve (Swap Rate Curve) and it calculates the Spot Curve that derives from it using the bootstrap technique.
Finally, it calculates the forward price of the bond portfolio for a given τ time.

Concerning the final task thing that instead of a spot curve we could use the forward curve but only for the cashflows after the τ time.

Forward Curve: A forward rate is an interest rate applicable to a financial transaction that will take place in the future. Forward rates are calculated from the spot rate and are adjusted for the cost of carry to determine the future interest rate that equates the total return of a longer-term investment with a strategy of rolling over a shorter-term investment. (https://www.investopedia.com/terms/f/forwardrate.asp)

Par Curve: A par yield curve is a graphical representation of the yields of hypothetical Treasury securities with prices at par. On the par yield curve, the coupon rate will equal the yield to maturity (YTM) of the security, which is why the Treasury bond will trade at par. The par yield curve can be compared with the spot yield curve and the forward yield curve for Treasuries. (https://www.investopedia.com/terms/p/par-yield-curve.asp)

# Change Curves

This code takes as a given a Forward Curve and it calculates the Spot Curve that derives from it.
This code takes as a given a Par Curve (Swap Rate Curve) and it calculates the Spot Curve that derives from it using the bootstrap technique.
Finally, it calculates the forward price of the bond portfolio for a given τ time.

Concerning the final task thing that instead of a spot curve we could use the forward curve but only for the cashflows after the τ time.

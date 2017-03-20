I'm a circular iterator allowing to cycle between a number of options.

Implementation Notes:
	To ease the rollover I keep the current index in a zero-based fashion to use module arithmetics to perform the rollover.
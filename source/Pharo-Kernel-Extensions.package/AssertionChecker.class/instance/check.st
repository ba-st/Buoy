checking
check

	| failurePolicy |

	failurePolicy := failurePolicyFactory new.
	failurePolicy applyTo: asserter
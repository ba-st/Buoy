private
value: aSuccessAction applying: policy

	| asserter |

	asserter := self class new.
	aSuccessAction value: asserter.
	asserter checkApplying: policy
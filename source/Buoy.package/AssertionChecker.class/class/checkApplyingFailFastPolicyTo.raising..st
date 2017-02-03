private
checkApplyingFailFastPolicyTo: asserter raising: errorToSignal

	^ (self applying: (RaiseOnFirstAssertionFailurePolicy raising: errorToSignal) to: asserter) check
Extension { #name : 'CoCaseSensitiveBeginsWithFilter' }

{ #category : '*Camel-Case-Matching' }
CoCaseSensitiveBeginsWithFilter >> accepts: aCandidate [

	^ (self candidate: aCandidate matchesPrefixCaseSensitive: true)
		or: [ NECPreferences camelCaseGlobalMatching
			and: [ self candidate: aCandidate matchesCamelCaseCaseSensitive: true ] ]
]

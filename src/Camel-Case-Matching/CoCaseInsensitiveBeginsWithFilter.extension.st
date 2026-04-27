Extension { #name : 'CoCaseInsensitiveBeginsWithFilter' }

{ #category : '*Camel-Case-Matching' }
CoCaseInsensitiveBeginsWithFilter >> accepts: aCandidate [

	^ (self candidate: aCandidate matchesPrefixCaseSensitive: false)
		or: [ NECPreferences camelCaseGlobalMatching
			and: [ self candidate: aCandidate matchesCamelCaseCaseSensitive: false ] ]
]

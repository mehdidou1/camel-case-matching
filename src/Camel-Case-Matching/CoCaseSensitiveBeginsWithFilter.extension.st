Extension { #name : 'CoCaseSensitiveBeginsWithFilter' }

{ #category : '*Camel-Case-Matching' }
CoCaseSensitiveBeginsWithFilter >> accepts: aCandidate [

	^ (self candidate: aCandidate matchesPrefixCaseSensitive: true)
		or: [ self candidate: aCandidate matchesCamelCaseCaseSensitive: true ]
]

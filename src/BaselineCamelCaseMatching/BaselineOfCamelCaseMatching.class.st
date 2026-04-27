Class {
	#name : 'BaselineOfCamelCaseMatching',
	#superclass : 'BaselineOf',
	#category : 'BaselineCamelCaseMatching',
	#package : 'BaselineCamelCaseMatching'
}

{ #category : 'baselines' }
BaselineOfCamelCaseMatching >> baseline: spec [

	<baseline>
	spec for: #common do: [

		spec package: 'Camel-Case-Matching'.
		spec package: 'Camel-Case-Matching-Tests' with: [ spec requires: #( 'Camel-Case-Matching' ) ].
		]
]

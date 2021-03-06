"
RTSelectionExample new installTitle: 'ElasticBoxZoom' 
		code:
'
| v |
v := RTGrapherExample new exampleDeviation.
v @ RTZoomableBoxView.
v
'
	
"
Class {
	#name : #RTSelectionExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-Selection'
}

{ #category : #sources }
RTSelectionExample >> exampleDifferentSelectionColor [

	| int v |
	v := RTComposerExample new exampleClassAnalysis2.
	int := RTSelectableView new.
	int color: [ :e | e color = Color red ifTrue: [Color green] ifFalse: [ Color red ] ].

	v @ int.
	^ v


]

{ #category : #icons }
RTSelectionExample >> exampleDifferentSelectionColorIcon [
	^ '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'
]

{ #category : #sources }
RTSelectionExample >> exampleElasticBoxZoom [

	| v |
	v := RTGrapherDecorationExample new exampleDeviation.
	v @ RTZoomableBoxView.
	^ v

]

{ #category : #icons }
RTSelectionExample >> exampleElasticBoxZoomIcon [
	^ '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
9PEAAAAASUVORK5CYII='
]

{ #category : #sources }
RTSelectionExample >> exampleSelectionChange [

| int v |
v := RTComposerExample new exampleClassAnalysis2.
int := RTSelectableView new.

int when: RTSelectionChange do: [ :evt | 
	evt shape trachelShape color: (int group size < 10 ifTrue: [Color green alpha: 0.3 ] ifFalse: [ Color red alpha: 0.3 ]) ].
v @ int.
^ v


]

{ #category : #icons }
RTSelectionExample >> exampleSelectionChangeIcon [
	^ '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'
]

{ #category : #sources }
RTSelectionExample >> exampleSimple [

	| v |
	v := RTComposerExample new exampleClassAnalysis2.
	v @ RTSelectableView.
	^ v

]

{ #category : #icons }
RTSelectionExample >> exampleSimpleIcon [
	^ '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'
]

{ #category : #accessing }
RTSelectionExample >> label [
	^ 'Selection Elements'.
]

Extension { #name : #FamixStMethod }

{ #category : #'*Moose-RoassalPaintings' }
FamixStMethod >> classBlueprintFillColor [
	
	self isPureAccessor ifTrue: [ ^ Color orange].
	
	self isSetter ifTrue: [ ^ Color red].

	self isGetter ifTrue: [ ^ Color orange].

	self isAbstract ifTrue: [ ^ Color cyan].

	self isOverriding ifTrue: [ ^ Color brown].

	self isConstant ifTrue: [ ^ Color gray].
	
	^ Color white.
]

{ #category : #'*Moose-RoassalPaintings' }
FamixStMethod >> sureInvokedClasses [
	
	self flag: #fixme.
	^ #()
]

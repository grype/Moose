"
Description
--------------------

I am a strategy managing the behavior of the Moose Queries depending on directions in the case where the query require the incomings associations.
"
Class {
	#name : #MooseQueryIncomingDirectionStrategy,
	#superclass : #MooseQueryAbstractDirectionStrategy,
	#category : #'Moose-Query'
}

{ #category : #accessing }
MooseQueryIncomingDirectionStrategy class >> allAssociationTypesFor: anEntity [
	^ anEntity allIncomingAssociationTypes
]

{ #category : #accessing }
MooseQueryIncomingDirectionStrategy class >> associationTypesFor: anEntity [
	^ anEntity incomingAssociationTypes
]

{ #category : #accessing }
MooseQueryIncomingDirectionStrategy class >> determinatingSymbol [
	^ #in
]

{ #category : #accessing }
MooseQueryIncomingDirectionStrategy class >> msePropertiesOf: anEntity [
	^ anEntity incomingMSEProperties
]

{ #category : #accessing }
MooseQueryIncomingDirectionStrategy class >> queryResultOn: anEntity with: aCollection [
	^ anEntity createIncomingQueryResultWith: aCollection
]

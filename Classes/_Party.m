// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Party.m instead.

#import "_Party.h"

@implementation PartyID
@end

@implementation _Party

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Party" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Party";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Party" inManagedObjectContext:moc_];
}

- (PartyID*)objectID {
	return (PartyID*)[super objectID];
}




@dynamic partyDate;






@dynamic partyFor;






@dynamic beenOrdered;



- (BOOL)beenOrderedValue {
	NSNumber *result = [self beenOrdered];
	return [result boolValue];
}

- (void)setBeenOrderedValue:(BOOL)value_ {
	[self setBeenOrdered:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveBeenOrderedValue {
	NSNumber *result = [self primitiveBeenOrdered];
	return [result boolValue];
}

- (void)setPrimitiveBeenOrderedValue:(BOOL)value_ {
	[self setPrimitiveBeenOrdered:[NSNumber numberWithBool:value_]];
}





@dynamic attendees;

	
- (NSMutableSet*)attendeesSet {
	[self willAccessValueForKey:@"attendees"];
	NSMutableSet *result = [self mutableSetValueForKey:@"attendees"];
	[self didAccessValueForKey:@"attendees"];
	return result;
}
	





@end

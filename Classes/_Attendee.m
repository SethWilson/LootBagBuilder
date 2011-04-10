// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Attendee.m instead.

#import "_Attendee.h"

@implementation AttendeeID
@end

@implementation _Attendee

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Attendee" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Attendee";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Attendee" inManagedObjectContext:moc_];
}

- (AttendeeID*)objectID {
	return (AttendeeID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"attendingPartyValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"attendingParty"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"iconChoiceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"iconChoice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"rsvpReceivedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"rsvpReceived"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic name;






@dynamic attendingParty;



- (BOOL)attendingPartyValue {
	NSNumber *result = [self attendingParty];
	return [result boolValue];
}

- (void)setAttendingPartyValue:(BOOL)value_ {
	[self setAttendingParty:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveAttendingPartyValue {
	NSNumber *result = [self primitiveAttendingParty];
	return [result boolValue];
}

- (void)setPrimitiveAttendingPartyValue:(BOOL)value_ {
	[self setPrimitiveAttendingParty:[NSNumber numberWithBool:value_]];
}





@dynamic iconChoice;



- (short)iconChoiceValue {
	NSNumber *result = [self iconChoice];
	return [result shortValue];
}

- (void)setIconChoiceValue:(short)value_ {
	[self setIconChoice:[NSNumber numberWithShort:value_]];
}

- (short)primitiveIconChoiceValue {
	NSNumber *result = [self primitiveIconChoice];
	return [result shortValue];
}

- (void)setPrimitiveIconChoiceValue:(short)value_ {
	[self setPrimitiveIconChoice:[NSNumber numberWithShort:value_]];
}





@dynamic rsvpReceived;



- (BOOL)rsvpReceivedValue {
	NSNumber *result = [self rsvpReceived];
	return [result boolValue];
}

- (void)setRsvpReceivedValue:(BOOL)value_ {
	[self setRsvpReceived:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveRsvpReceivedValue {
	NSNumber *result = [self primitiveRsvpReceived];
	return [result boolValue];
}

- (void)setPrimitiveRsvpReceivedValue:(BOOL)value_ {
	[self setPrimitiveRsvpReceived:[NSNumber numberWithBool:value_]];
}





@dynamic goingToParty;

	





@end

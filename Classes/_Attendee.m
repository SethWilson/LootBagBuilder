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

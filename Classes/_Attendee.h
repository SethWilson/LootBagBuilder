// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Attendee.h instead.

#import <CoreData/CoreData.h>


@class Party;






@interface AttendeeID : NSManagedObjectID {}
@end

@interface _Attendee : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (AttendeeID*)objectID;



@property (nonatomic, retain) NSString *name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSNumber *attendingParty;

@property BOOL attendingPartyValue;
- (BOOL)attendingPartyValue;
- (void)setAttendingPartyValue:(BOOL)value_;

//- (BOOL)validateAttendingParty:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSString *iconChoice;

//- (BOOL)validateIconChoice:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSNumber *rsvpReceived;

@property BOOL rsvpReceivedValue;
- (BOOL)rsvpReceivedValue;
- (void)setRsvpReceivedValue:(BOOL)value_;

//- (BOOL)validateRsvpReceived:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) Party* goingToParty;
//- (BOOL)validateGoingToParty:(id*)value_ error:(NSError**)error_;




@end

@interface _Attendee (CoreDataGeneratedAccessors)

@end

@interface _Attendee (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;


- (NSNumber*)primitiveAttendingParty;
- (void)setPrimitiveAttendingParty:(NSNumber*)value;

- (BOOL)primitiveAttendingPartyValue;
- (void)setPrimitiveAttendingPartyValue:(BOOL)value_;


- (NSString*)primitiveIconChoice;
- (void)setPrimitiveIconChoice:(NSString*)value;


- (NSNumber*)primitiveRsvpReceived;
- (void)setPrimitiveRsvpReceived:(NSNumber*)value;

- (BOOL)primitiveRsvpReceivedValue;
- (void)setPrimitiveRsvpReceivedValue:(BOOL)value_;




- (Party*)primitiveGoingToParty;
- (void)setPrimitiveGoingToParty:(Party*)value;


@end

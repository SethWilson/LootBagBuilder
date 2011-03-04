// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Party.h instead.

#import <CoreData/CoreData.h>


@class Attendee;





@interface PartyID : NSManagedObjectID {}
@end

@interface _Party : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PartyID*)objectID;



@property (nonatomic, retain) NSString *partyDate;

//- (BOOL)validatePartyDate:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSString *partyFor;

//- (BOOL)validatePartyFor:(id*)value_ error:(NSError**)error_;



@property (nonatomic, retain) NSNumber *beenOrdered;

@property BOOL beenOrderedValue;
- (BOOL)beenOrderedValue;
- (void)setBeenOrderedValue:(BOOL)value_;

//- (BOOL)validateBeenOrdered:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSSet* attendees;
- (NSMutableSet*)attendeesSet;




@end

@interface _Party (CoreDataGeneratedAccessors)

- (void)addAttendees:(NSSet*)value_;
- (void)removeAttendees:(NSSet*)value_;
- (void)addAttendeesObject:(Attendee*)value_;
- (void)removeAttendeesObject:(Attendee*)value_;

@end

@interface _Party (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitivePartyDate;
- (void)setPrimitivePartyDate:(NSString*)value;


- (NSString*)primitivePartyFor;
- (void)setPrimitivePartyFor:(NSString*)value;


- (NSNumber*)primitiveBeenOrdered;
- (void)setPrimitiveBeenOrdered:(NSNumber*)value;

- (BOOL)primitiveBeenOrderedValue;
- (void)setPrimitiveBeenOrderedValue:(BOOL)value_;




- (NSMutableSet*)primitiveAttendees;
- (void)setPrimitiveAttendees:(NSMutableSet*)value;


@end

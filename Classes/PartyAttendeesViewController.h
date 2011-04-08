//
//  PartyAttendeesViewController.h
//  LootBagBuilder
//
//  Created by Seth Wilson on 11-02-15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Party.h"
#import "Attendee.h"
#import "LootBagBuilderAppDelegate.h"


@interface PartyAttendeesViewController : UITableViewController {
	NSMutableArray *_tmpPartyAttendees;
	//NSMutableSet *_tmpPartyAttendees;
	UIButton *_buttonChooseIcon;
	Party *_party;
	NSManagedObjectContext *managedObjectContext;  
		
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext; 
@property (nonatomic, retain) NSMutableArray *tmpPartyAttendees;
@property (nonatomic, retain) UIButton *buttonChooseIcon;
@property (nonatomic, retain) Party *party;

- (void) addAttendee;
- (id)initWithParty:(Party *)aParty;

@end

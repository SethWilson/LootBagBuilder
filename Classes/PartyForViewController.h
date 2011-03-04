//
//  PartyForViewController.h
//  LootBagBuilder
//
//  Created by Seth Wilson on 11-02-15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Party.h"

@interface PartyForViewController : UIViewController <UITextFieldDelegate> {
	UITextField *_partyGuestOfHonour;
	UIButton *_btnDone;
	Party *_party;
	NSManagedObjectContext *managedObjectContext;  
	
	
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext; 
@property (nonatomic, retain) IBOutlet UITextField *partyGuestOfHonour;
@property (nonatomic, retain) IBOutlet UIButton	*btnDone;
@property (nonatomic, retain) Party *party;


- (id)initWithParty:(Party *)aParty;
- (IBAction)buttonDonePressed:(id)sender ;
- (IBAction)backgroundTouched:(id)sender;
@end

//
//  PartyDateViewController.h
//  LootBagBuilder
//
//  Created by Seth Wilson on 11-02-15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Party.h"
#import "LootBagBuilderAppDelegate.h"

@interface PartyDateViewController : UIViewController {
	UIButton *_btnDone;
	UIDatePicker *_datePicker;
	Party *_party;
	NSManagedObjectContext *managedObjectContext;  
	
	
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext; 

@property (nonatomic, retain) IBOutlet UIButton	*btnDone;
@property (nonatomic, retain) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, retain) Party *party;

- (IBAction)buttonDonePressed:(id)sender ;
- (id)initWithParty:(Party *)aParty;

@end

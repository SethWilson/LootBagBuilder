//
//  PartyListViewController.h
//  LootBagBuilder
//
//  Created by Seth Wilson on 11-02-08.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Party.h"

@interface PartyListViewController : UITableViewController {


	NSMutableArray *partyList;
	NSManagedObjectContext *managedObjectContext;  

	
}

@property (nonatomic, retain) NSMutableArray *partyList;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext; 


- (void) fetchParties;  
- (void) addParty;


@end

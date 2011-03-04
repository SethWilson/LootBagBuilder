//
//  PartyDetailsViewController.h
//  LootBagBuilder
//
//  Created by Seth Wilson on 11-02-08.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Party.h"

@interface PartyDetailsViewController : UITableViewController {
	NSArray *partyDetailActions;
	Party	*_party;
	
}

@property (nonatomic, retain) NSArray *partyDetailActions;
@property (nonatomic, retain) Party *party;

- (id)initWithParty:(Party *)aParty;

@end

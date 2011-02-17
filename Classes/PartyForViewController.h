//
//  PartyForViewController.h
//  LootBagBuilder
//
//  Created by Seth Wilson on 11-02-15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PartyForViewController : UIViewController <UITextFieldDelegate> {
	UITextField *_partyGuestOfHonour;
	UIButton *_btnDone;
}


@property (nonatomic, retain) IBOutlet UITextField *partyGuestOfHonour;
@property (nonatomic, retain) IBOutlet UIButton	*btnDone;

- (IBAction)buttonDonePressed:(id)sender ;
- (IBAction)backgroundTouched:(id)sender;
@end

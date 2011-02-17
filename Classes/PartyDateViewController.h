//
//  PartyDateViewController.h
//  LootBagBuilder
//
//  Created by Seth Wilson on 11-02-15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PartyDateViewController : UIViewController {
	UIButton *_btnDone;
	UIDatePicker *_datePicker;
}

@property (nonatomic, retain) IBOutlet UIButton	*btnDone;
@property (nonatomic, retain) IBOutlet UIDatePicker *datePicker;

- (IBAction)buttonDonePressed:(id)sender ;

@end

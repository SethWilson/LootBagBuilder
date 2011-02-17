//
//  AddPartyGoerController.h
//  LootBagBuilder
//
//  Created by Seth Wilson on 11-02-15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddPartyGoerController : UIViewController {

	UIButton *_buttonChooseIcon;
}


@property (nonatomic, retain) IBOutlet UIButton *buttonChooseIcon;

- (IBAction)buttonChooseIconPressed:(id)sender ;

@end

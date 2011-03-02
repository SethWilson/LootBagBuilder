//
//  AddPartyGoerController.h
//  LootBagBuilder
//
//  Created by Seth Wilson on 11-02-15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JPImagePickerController.h"

@interface AddPartyGoerController : UIViewController <JPImagePickerControllerDelegate, JPImagePickerControllerDataSource, UITextFieldDelegate> {

	UIButton *_buttonChooseIcon;
	NSInteger chosenImage;
	UITextField *_labelName;
	BOOL buttonRSVPSelected;
	BOOL buttonAttendingSelected;
	IBOutlet UIButton *_buttonRSVP;
	IBOutlet UIButton *_buttonAttending;
	IBOutlet UIWebView *_webPreview;
	IBOutlet UIViewController *chosenImageController;
	IBOutlet UIImageView *chosenImageView;
	
}


@property (nonatomic, retain) IBOutlet UIButton *buttonChooseIcon;
@property (nonatomic, retain) IBOutlet UIViewController *chosenImageController;
@property (nonatomic, retain) IBOutlet UIImageView *chosenImageView;
@property (nonatomic, retain) IBOutlet UITextField *labelName;
@property (nonatomic, retain) IBOutlet UIWebView *webPreview;
@property (nonatomic, retain) IBOutlet UIButton *buttonRSVP;
@property (nonatomic, retain) IBOutlet UIButton *buttonAttending;

- (IBAction)buttonChooseIconPressed:(id)sender ;
- (IBAction)backgroundTouched:(id)sender ;
- (IBAction)checkboxButton:(id)sender;

@end




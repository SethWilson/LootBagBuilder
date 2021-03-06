//
//  AddPartyGoerController.m
//  LootBagBuilder
//
//  Created by Seth Wilson on 11-02-15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AddPartyGoerController.h"

@implementation AddPartyGoerController

@synthesize buttonChooseIcon = _buttonChooseIcon;
@synthesize chosenImageView, chosenImageController;
@synthesize labelName = _labelName;
@synthesize webPreview = _webPreview;
@synthesize buttonRSVP = _buttonRSVP;
@synthesize buttonAttending = _buttonAttending;

#define THUMBNAIL_SIZE 80
#define IMAGE_WIDTH 320
#define IMAGE_HEIGHT 400

/*
 
 Attendee *attendee = [Attendee insertInManagedObjectContext:self.managedObjectContext];;
 
 attendee.iconChoice = [NSNumber numberWithInt:1005];
 attendee.name = @"Aidan";
 attendee.attendingParty = [NSNumber numberWithBool:NO];
 attendee.rsvpReceived = [NSNumber numberWithBool:NO];
 
 // Create a placeholder object
 NSSet *attendees;
 attendees = [NSSet setWithObjects:attendee, nil];
 [party setPartyDate: nil]; 
 [party setPartyFor:nil]; 
 [party setBeenOrdered:[NSNumber numberWithBool:YES]];
 [party setAttendees:attendees];
 
 
 */
- (id)init {
	self = [super init];
	if( self != nil ) {
		[[NSBundle mainBundle] loadNibNamed:@"AddPartyGoerController" owner: self options: nil];
		self.navigationItem.title = @"Add an Attendee";
		//[self setPartyDetailActions:[NSArray arrayWithObjects:@"Party For: ", @"Party Date: ", @"Party Attendees: ",nil]];
		buttonRSVPSelected = NO;
		buttonAttendingSelected = NO;
		
		NSString *urlAddress = @"http://preview.mabel.ca/preview.aspx?m=lol%20loot%20bag&t0=&i=1002&c=&s=175&l=enUS&v=a";
		NSURL *url = [NSURL URLWithString:urlAddress];
		NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
		
		[self.webPreview loadRequest:requestObject];
	}
	
	
	return self;
}

- (IBAction)buttonChooseIconPressed:(id)sender {
	
	NSLog(@"Choose icon pressed");
	
	// Load gallery
	
	JPImagePickerController *imagePickerController = [[JPImagePickerController alloc] init];
	
	imagePickerController.delegate = self;
	imagePickerController.dataSource = self;
	imagePickerController.imagePickerTitle = @"Choose your Icon";
	
	[self.navigationController presentModalViewController:imagePickerController animated:YES];
	[imagePickerController release];	
	
}


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

# pragma mark -
# pragma mark JPImagePickerControllerDelegate

- (void)imagePickerDidCancel:(JPImagePickerController *)picker {
	[self.navigationController dismissModalViewControllerAnimated:YES];
}

- (void)imagePicker:(JPImagePickerController *)picker didFinishPickingWithImageNumber:(NSInteger)imageNumber {
	chosenImage = imageNumber;

	[self.navigationController dismissModalViewControllerAnimated:YES];
	if (chosenImage != -1) {
		//cell.imageView.image = [[UIImage imageNamed:[NSString stringWithFormat:@"icon10%02i.png", imageNumber + 1]] scaleToSize:CGSizeMake(THUMBNAIL_SIZE, THUMBNAIL_SIZE) onlyIfNeeded:YES];
		[self.buttonChooseIcon setImage:[UIImage imageNamed:[NSString stringWithFormat:@"icon10%02i.png", chosenImage + 1]] forState:UIControlStateNormal];
		
		//update Preview
		NSString *firstPart = @"http://preview.mabel.ca/preview.aspx?m=lol%20loot%20bag&t0="; //stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
		NSString *lastPart = @"&c=&s=175&l=enUS&v=a";
		
		NSString *urlAddress = [NSString stringWithFormat:@"%@&i=10%02i%@", firstPart, chosenImage + 1, lastPart];
		
		NSLog(@"%@",urlAddress);
		
		NSURL *url = [NSURL URLWithString:urlAddress];
		NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
		
		[self.webPreview loadRequest:requestObject];
	}
	 
}

# pragma mark JPImagePickerControllerDataSource

- (NSInteger)numberOfImagesInImagePicker:(JPImagePickerController *)picker {
	return 27;
}

- (UIImage *)imagePicker:(JPImagePickerController *)picker thumbnailForImageNumber:(NSInteger)imageNumber {
	return [UIImage imageNamed:[NSString stringWithFormat:@"icon10%02i.png", imageNumber + 1]];
}

- (UIImage *)imagePicker:(JPImagePickerController *)imagePicker imageForImageNumber:(NSInteger)imageNumber {
	return [UIImage imageNamed:[NSString stringWithFormat:@"large10%02i.png", imageNumber + 1]];
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
	
	if (textField == self.labelName) {
		NSLog(@"Name for label is %@", textField.text);



		
	}
}

- (BOOL)textFieldShouldReturn:(UITextField *)aTextField {
	
	if (aTextField == self.labelName) {
		
		[self.labelName resignFirstResponder];
		
		if (chosenImage != -1) {
			//update Preview
			NSString *firstPart = @"http://preview.mabel.ca/preview.aspx?m=lol%20loot%20bag&t0="; //stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
			NSString *lastPart = @"&c=&s=175&l=enUS&v=a";
			
			
			NSString *name = self.labelName.text;
			
			NSString *urlAddress = [NSString stringWithFormat:@"%@%@&i=10%02i%@", firstPart, name, chosenImage + 1, lastPart];
			
			NSLog(@"%@",urlAddress);
			
			NSURL *url = [NSURL URLWithString:urlAddress];
			NSURLRequest *requestObject = [NSURLRequest requestWithURL:url];
			
			[self.webPreview loadRequest:requestObject];
		}
	
	}
	return YES;
}

-(IBAction)backgroundTouched:(id)sender
{
	[self.labelName resignFirstResponder];
}


- (IBAction)checkboxButton:(id)sender{
	
	if (sender == self.buttonRSVP) {
		if (buttonRSVPSelected == 0){
			[self.buttonRSVP setSelected:YES];
			buttonRSVPSelected = 1;
		} else {
			[self.buttonRSVP setSelected:NO];
			buttonRSVPSelected = 0;
		}
	}
	
	if (sender == self.buttonAttending) {
		if (buttonAttendingSelected == 0){
			[self.buttonAttending setSelected:YES];
			buttonAttendingSelected = 1;
		} else {
			[self.buttonAttending setSelected:NO];
			buttonAttendingSelected = 0;
		}
	}
	
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

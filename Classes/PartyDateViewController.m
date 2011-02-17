//
//  PartyDateViewController.m
//  LootBagBuilder
//
//  Created by Seth Wilson on 11-02-15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PartyDateViewController.h"


@implementation PartyDateViewController
@synthesize btnDone = _btnDone;
@synthesize datePicker = _datePicker;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

- (id)init {
	self = [super init];
	if( self != nil ) {
		[[NSBundle mainBundle] loadNibNamed:@"PartyDateViewController" owner: self options: nil];
		
		//[self setPartyDetailActions:[NSArray arrayWithObjects:@"Party For: ", @"Party Date: ", @"Party Attendees: ",nil]];
		self.navigationItem.title = @"Party Date";
	}
	
	
	return self;
}

- (IBAction)buttonDonePressed:(id)sender {
	
	NSLog(@"Done button on the date picker screen pressed");
	
	// Save the value of the date picker
	NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"MMM dd, yyyy HH:mm:ss"];
    NSLog(@"%@",[dateformatter stringFromDate:[self.datePicker date]]);
	
	// If all good then save a new record and kick back a screen
	
	[self.navigationController popViewControllerAnimated:YES];
	
}

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

//
//  PartyForViewController.m
//  LootBagBuilder
//
//  Created by Seth Wilson on 11-02-15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PartyForViewController.h"
#import "LootBagBuilderAppDelegate.h"

@implementation PartyForViewController

@synthesize partyGuestOfHonour = _partyGuestOfHonour, btnDone = _btnDone;
@synthesize party = _party;
@synthesize managedObjectContext;


- (id)init {
	self = [super init];
	if( self != nil ) {
		[[NSBundle mainBundle] loadNibNamed:@"PartyForViewController" owner: self options: nil];
		self.navigationItem.title = @"Party For";
	}
	
	
	return self;
}


- (id)initWithParty:(Party *)aParty {
	self = [super init];
	if( self != nil ) {
		[[NSBundle mainBundle] loadNibNamed:@"PartyForViewController" owner: self options: nil];
		self.navigationItem.title = @"Party For";
		
		
		[self setParty:aParty];
		
		
		LootBagBuilderAppDelegate *appDelegate = (LootBagBuilderAppDelegate *)[[UIApplication sharedApplication] delegate];
		
		[self setManagedObjectContext:appDelegate.managedObjectContext];
		

		
	}
	
	
	
	return self;	
	
	
}


- (IBAction)buttonDonePressed:(id)sender {
	
	NSLog(@"Done button pressed");

	// Test for blank name field and show if blank
	
	self.party.partyFor = self.partyGuestOfHonour.text;

	
	NSLog(@"%@", self.party.partyFor);
	
	// If all good then save a new record and kick back a screen
	
	NSError *error;
	
	
	if(![[self managedObjectContext] save:&error]){  
		NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        //This is a serious error saying the record  
        //could not be saved. Advise the user to  
        //try again or restart the application.   
		
    }  
	
	
	[self.navigationController popViewControllerAnimated:YES];
	
}

- (BOOL)textFieldShouldReturn:(UITextField *)aTextField {
	
	if (aTextField == self.partyGuestOfHonour)
		[self.partyGuestOfHonour resignFirstResponder];
	
	return YES;
}

-(IBAction)backgroundTouched:(id)sender
{
	[self.partyGuestOfHonour resignFirstResponder];
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
	
	if (textField == self.partyGuestOfHonour) {
		NSLog(@"Guest of honour is %@", textField.text);
	}
	
	
}

- (void)viewWillAppear:(BOOL)animated {
	NSLog(@"%@", [[self party] partyFor]);
	
    [super viewWillAppear:animated];
	[[self partyGuestOfHonour] setText:[[self party] partyFor]];//;
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

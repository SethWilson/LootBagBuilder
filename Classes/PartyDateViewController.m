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
@synthesize party = _party;
@synthesize managedObjectContext;

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
		
		NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:@"yyyy-MM-dd"];
		 
		NSDate *dateFromString = [[NSDate alloc] init];
		dateFromString = [dateFormatter dateFromString:@"2011-04-14"];
		
		self.datePicker.date = dateFromString;
		
		//[dateFormatter release];
		//[dateFromString release];
	}

	
	
	return self;
}


- (id)initWithParty:(Party *)aParty {
	self = [super init];
	if( self != nil ) {
		[[NSBundle mainBundle] loadNibNamed:@"PartyDateViewController" owner: self options: nil];
		
		self.navigationItem.title = @"Party Date";
		

		[self setParty:aParty];
		
		NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateFormat:@"yyyy-MM-dd"];
		
		NSDate *dateFromString = [[NSDate alloc] init];

		if ([aParty partyDate] == nil)
			
			self.datePicker.date = [NSDate date];
			
		else {
			
			dateFromString = [dateFormatter dateFromString:[aParty partyDate]];
			self.datePicker.date = dateFromString;

		}
				
		
		
		LootBagBuilderAppDelegate *appDelegate = (LootBagBuilderAppDelegate *)[[UIApplication sharedApplication] delegate];
		
		[self setManagedObjectContext:appDelegate.managedObjectContext];
		
	  //[dateFormatter release];
	  //[dateFromString release];

	}
	
	NSLog(@"%@", self.party.attendees);
	
	return self;	

	
}

- (IBAction)buttonDonePressed:(id)sender {
	
	NSLog(@"Done button on the date picker screen pressed");
	
	// Save the value of the date picker
	NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd"];
	

	
	self.party.partyDate = [dateformatter stringFromDate:[self.datePicker date]];
	NSLog(@"%@", [dateformatter stringFromDate:[self.datePicker date]]);
	
	NSLog(@"%@", self.party.partyDate);
	
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

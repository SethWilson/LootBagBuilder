//
//  PartyDetailsViewController.m
//  LootBagBuilder
//
//  Created by Seth Wilson on 11-02-08.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PartyDetailsViewController.h"
#import "PartyDateViewController.h"
#import "PartyForViewController.h"
#import "PartyAttendeesViewController.h"


@implementation PartyDetailsViewController
@synthesize partyDetailActions;

- (id)init {
	self = [super init];
	if( self != nil ) {
		[[NSBundle mainBundle] loadNibNamed:@"PartyDetailsViewController" owner: self options: nil];
	
		[self setPartyDetailActions:[NSArray arrayWithObjects:@"Party For: ", @"Party Date: ", @"Party Attendees: ",nil]];
		self.navigationItem.title = @"Party Details";
	}
	
	
	return self;
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.

/*
 
 Ask Derek why this was never called??
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
	

}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section

{

	return @"Party Details";

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
	cell.textLabel.text = [partyDetailActions objectAtIndex:indexPath.row]; 
    
    // Configure the cell...
    
    return cell;
}



 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 



 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	//	Party *currentParty = [self.partyList objectAtIndex: indexPath.row ];
	//	[self.navigationController pushViewController:  animated:<#(BOOL)animated#>
	
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 */
	 
	switch (indexPath.row) {
		case 0: 
			NSLog(@"Party For Pressed");
			PartyForViewController *partyFor = [[PartyForViewController alloc] init];
			[self.navigationController pushViewController: partyFor animated: YES];
			[self.navigationController setTitle:@"Party For"];
			break;
		case 1:
			NSLog(@"Party Date Pressed");
			PartyDateViewController *partyDate = [[PartyDateViewController alloc] init];
			[self.navigationController pushViewController: partyDate animated: YES];
			break; 
		case 2:
			NSLog(@"Party Attendee Pressed");
			PartyAttendeesViewController *partyAttendees = [[PartyAttendeesViewController alloc] init];
			[self.navigationController pushViewController: partyAttendees animated: YES];
			break; 
		default:
			break;
	}
	
	//	[self.navigationController pushViewController:detailViewController animated:YES];
	// [detailViewController release];
	 
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

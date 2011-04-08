//
//  PartyListViewController.m
//  LootBagBuilder
//
//  Created by Seth Wilson on 11-02-08.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PartyListViewController.h"
#import "PartyDetailsViewController.h"
#import "Party.h"
#import "LootBagBuilderAppDelegate.h"
#import "Attendee.h"

@implementation PartyListViewController
@synthesize partyList;
@synthesize managedObjectContext;

#pragma mark -
#pragma mark View lifecycle


- (void)addParty {
	NSLog(@"adding a party");
	
	//Party *party = (Party *)[NSEntityDescription insertNewObjectForEntityForName:@"Party" inManagedObjectContext:managedObjectContext];
	
	Party *party = [Party insertInManagedObjectContext:self.managedObjectContext];
	
	
	/*
	NSDate *today = [NSDate date];
	NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"yyyy-MM-dd"];
	NSString *dateString = [dateFormat stringFromDate:today];
	NSLog(@"date: %@", dateString);
	*/
		
	Attendee *attendee = [Attendee insertInManagedObjectContext:self.managedObjectContext];;
	
	attendee.iconChoiceValue = 1005;
	attendee.name = @"Aidan";
	attendee.attendingPartyValue = NO;
	attendee.rsvpReceivedValue = NO;

	attendee.goingToParty = party;
	[party addAttendeesObject:attendee];

	
	
	NSError *error;
	
	
	if(![[self managedObjectContext] save:&error]){  
		NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        //This is a serious error saying the record  
        //could not be saved. Advise the user to  
        //try again or restart the application.   
		
    }  
	
	
    [[self partyList] insertObject:party atIndex:0];  
	
    [self.tableView reloadData]; 
	
	
	PartyDetailsViewController *partyDetails = [[PartyDetailsViewController alloc] initWithParty:party];
//	partyDetails.party = [[Party alloc] init];
	[self.navigationController pushViewController: partyDetails animated: YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target: self action: @selector(addParty)];
	self.navigationItem.rightBarButtonItem = addButton;
	[addButton release]; 
	

	LootBagBuilderAppDelegate *appDelegate = (LootBagBuilderAppDelegate *)[[UIApplication sharedApplication] delegate];

	[self setManagedObjectContext:appDelegate.managedObjectContext];
	//[self setTmpPartyList:[NSArray arrayWithObjects:@"Aidan", @"Carter", @"Trish",@"Seth",nil]];
	[self fetchParties];

}

- (void)fetchParties {   

    // Define our table/entity to use  
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Party" inManagedObjectContext:managedObjectContext];   
	
    // Setup the fetch request  
    NSFetchRequest *request = [[NSFetchRequest alloc] init];  
    [request setEntity:entity];   

    // Define how we will sort the records  
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"partyDate" ascending:NO];  
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];  
    [request setSortDescriptors:sortDescriptors];  
    [sortDescriptor release];   
	
    // Fetch the records and handle an error  
    NSError *error;  
    NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];   
	
    if (!mutableFetchResults) {  
        // Handle the error.  
        // This is a serious error and should advise the user to restart the application  
    }   
	
    // Save our fetched data to an array  
    [self setPartyList:mutableFetchResults];  
    [mutableFetchResults release];  
    [request release];  
}   



- (void)viewWillAppear:(BOOL)animated {
	
	
    [super viewWillAppear:animated];
	[self fetchParties];

	[[self tableView] reloadData];
}

/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section

{
	
	return @"Parties";
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.partyList count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
	
	Party *party = [partyList objectAtIndex:[indexPath row]];
	
	cell.textLabel.text = [party partyFor];
	cell.detailTextLabel.text = [party partyDate];
    
    // Configure the cell...
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



/*
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
*/


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
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
	
	
	PartyDetailsViewController *partyDetails = [[PartyDetailsViewController alloc] initWithParty:[self.partyList objectAtIndex:indexPath.row ]];
	[self.navigationController pushViewController: partyDetails animated: YES];
	
}





#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {

    [super dealloc];
}


@end


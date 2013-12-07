//
//  HelpView.m
//  Assignment
//
//  Created by DK on 12/3/13.
//  Copyright (c) 2013 DK. All rights reserved.
//

#import "HelpView.h"

@interface HelpView ()

@end

@implementation HelpView
@synthesize detailView;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self->dataList = [[NSArray alloc]initWithObjects:@"test1", @"test2", @"test3", nil];
    
    NSString *descPath = [[NSBundle mainBundle]pathForResource:@"HelpDetailInfo" ofType:@"plist"];
    steps = [[NSDictionary alloc]initWithContentsOfFile:descPath];
    
    NSArray *tmp = [[steps allKeys] sortedArrayUsingSelector:@selector(compare:)];
    keys = [[NSArray alloc]initWithArray:tmp];
    //msgView.text = [steps objectForKey:[keys objectAtIndex:eReset]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [dataList count];
    return [keys count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    //cell.textLabel.text = [dataList objectAtIndex:[indexPath row]];
    cell.textLabel.text = [keys objectAtIndex:[indexPath row]];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSDictionary *row = [dataList objectAtIndex:[indexPath row]];
	if (detailView == nil) {
		detailView = [[HelpDetailView alloc]
					  initWithNibName:@"HelpDetailView" bundle:nil];
	}
	//detailView.title = [dataList objectAtIndex:[indexPath row]];
    detailView.title = [keys objectAtIndex:[indexPath row]];
	//detailView.sName = [dataList objectAtIndex:[indexPath row]];
	detailView.sName = [steps objectForKey:[keys objectAtIndex:[indexPath row]]];
    //detailView.description.text = [steps objectForKey:[keys objectAtIndex:[indexPath row]]];
    //NSLog(@"%@", [steps objectForKey:[keys objectAtIndex:[indexPath row]]]);
    NSLog(@"%@", detailView.sName);
	[self.navigationController pushViewController:detailView animated:YES];
}
 


@end

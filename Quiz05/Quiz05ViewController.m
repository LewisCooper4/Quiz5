//
//  Quiz05ViewController.m
//  Quiz05
//
//  Created by Lewis Cooper on 3/17/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import "Quiz05ViewController.h"
#import "Quiz05TableViewController.h"
#import "TaskManager.h"

@interface Quiz05ViewController ()

@end

@implementation Quiz05ViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {    
    }
    return self;
}


- (void) viewWillAppear:(BOOL)animated
{
    [taskManager sortTasks];
    
    [[self tableView] reloadData];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    taskManager = [[TaskManager alloc] init];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    int index = [indexPath row];
    
    Task *task = [taskManager getTaskAtIndex:index];
    
    cell.textLabel.text = [task name];
    
    // get the proper format for the date
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterFullStyle];
    NSString *formattedDate = [formatter stringFromDate:task.dueDate];
    
    cell.textLabel.text = task.name;
    cell.detailTextLabel.text = formattedDate;
    
    UIView *myView = [[UIView alloc] init];
    myView.backgroundColor = [UIColor colorWithRed:task.urgency/10.0f green:1-task.urgency/10.0f blue:0.0 alpha:0.5f];
    cell.backgroundView = myView;
    
    if (task.urgency >= 6) {
        cell.imageView.image = [UIImage imageNamed:@"urgent.jpg"];
    }
    else {
        cell.imageView.image = nil;
    }

    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
  
     Quiz05TableViewController *detailViewController = [[Quiz05TableViewController alloc] initWithNibName:@"Quiz05TableViewController" bundle:nil];
    
    
    [detailViewController setTask:[taskManager getTaskAtIndex:[indexPath row]]];
    
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     
}

@end

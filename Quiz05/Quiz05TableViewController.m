//
//  Quiz05TableViewController.m
//  Quiz05
//
//  Created by Lewis Cooper on 3/17/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import "Quiz05TableViewController.h"

@interface Quiz05TableViewController ()

@end

@implementation Quiz05TableViewController
@synthesize urgencySliderOutlet;
@synthesize datePicker;
@synthesize urgencylabel;
@synthesize taskNameTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setDatePicker:nil];
    [self setUrgencylabel:nil];
    [self setTaskNameTextField:nil];
    [self setUrgencySliderOutlet:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



- (void) viewWillAppear:(BOOL)animated
{
    [datePicker setDate:task.dueDate];
    [urgencylabel setText:[NSString stringWithFormat:@"Urgency: %.2f", task.urgency]];
    [urgencySliderOutlet setValue:task.urgency/10.0];
    [taskNameTextField setText:task.name];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [taskNameTextField resignFirstResponder];
    
    return YES;
}


- (void) setTask:(Task *)newTask
{
   task = newTask;
}


- (IBAction)save:(id)sender {
    
    [task setDueDate:[datePicker date]];
    [task setName:[taskNameTextField text]];
    [task setUrgency:[urgencySliderOutlet value] * 10.0];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)urgencySlider:(id)sender {
    [self.urgencylabel setText:[NSString stringWithFormat:@"Urgency: %.2f", [urgencySliderOutlet value] * 10.0]];
}
@end

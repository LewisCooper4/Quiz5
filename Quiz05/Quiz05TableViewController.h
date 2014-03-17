//
//  Quiz05TableViewController.h
//  Quiz05
//
//  Created by Lewis Cooper on 3/17/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface Quiz05TableViewController : UIViewController <UITextFieldDelegate>
{
    Task *task;
}


@property (weak, nonatomic) IBOutlet UISlider *urgencySliderOutlet;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *urgencylabel;
@property (weak, nonatomic) IBOutlet UITextField *taskNameTextField;

- (IBAction)save:(id)sender;
- (IBAction)urgencySlider:(id)sender;


- (void) setTask:(Task *)newTask;


@end

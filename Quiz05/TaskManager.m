//
//  TaskManager.m
//  Quiz05
//
//  Created by Lewis Cooper on 3/17/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import "TaskManager.h"
#import "Task.h"

@implementation TaskManager

- (id) init
{
    self = [super init];
    
    
    
    if (self) {
        
        tasks = [[NSMutableArray alloc] initWithCapacity:10];
        
        for (int i = 0; i < 10; i++) {
            
            // create the new task
            Task *newTask = [[Task alloc] init];
            
            // set the name of the task
            [newTask setName:[NSString stringWithFormat:@"Task #%d", i]];
            
            // get the current date then increase it by correct amount of days
            NSDate *today = [NSDate date];
            NSDate *newDate = [today dateByAddingTimeInterval:60*60*24*i];
            
            [newTask setDueDate:newDate];
            
            [newTask setUrgency:i];
            
            [tasks addObject:newTask];
            
        }
        
    }
    
    
    return self;
    
}


- (void) sortTasks
{
    NSArray *sortedTasks = [tasks sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSDate *d1 = [obj1 dueDate];
        NSDate *d2 = [obj2 dueDate];
        return [d1 compare:d2];
    }];
    
    tasks = [NSMutableArray arrayWithArray:sortedTasks];
}


- (Task *) getTaskAtIndex:(NSInteger)index
{
    return [tasks objectAtIndex:index];
}

@end

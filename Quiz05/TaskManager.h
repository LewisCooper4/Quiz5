//
//  TaskManager.h
//  Quiz05
//
//  Created by Lewis Cooper on 3/17/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@interface TaskManager : NSObject
{
    NSMutableArray *tasks;
}

- (void) sortTasks;
- (Task *) getTaskAtIndex:(NSInteger)index;

@end

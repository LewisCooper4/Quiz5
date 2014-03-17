//
//  Task.h
//  Quiz05
//
//  Created by Lewis Cooper on 3/17/14.
//  Copyright (c) 2014 Lewis Cooper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject


@property (nonatomic) NSString *name;
@property (nonatomic) CGFloat urgency;
@property (nonatomic) NSDate *dueDate;

@end

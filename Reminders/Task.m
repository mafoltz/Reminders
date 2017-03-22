//
//  Task.m
//  Reminders
//
//  Created by Gunter Hertz on 22/03/17.
//  Copyright © 2017 Marcelo Andrighetto Foltz. All rights reserved.
//

#import "Task.h"
@interface Task()
@property NSNumber *taskId;

@end

@implementation Task

- (instancetype)initWithId:(NSNumber *)taskID
{
    self = [super init];
    if (self) {
        _isCompleted = NO;
        _taskDate = [NSDate date];
        _taskMessage = @"teste";
        //taskID?
    }
    return self;
}

@end

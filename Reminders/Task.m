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

- (instancetype)initWithId:(NSNumber *)taskID andWithTaskDate:(NSString *)taskDate andtaskMessage:(NSString *)taskMessage
{
    self = [super init];
    if (self) {
        _isCompleted = NO;
        _taskDate = [self getDateFromString:taskDate];
        _taskMessage = taskMessage;
        
    }
    return self;
}


- (NSDate *)getDateFromString:(NSString *)dateString{
    return [NSDate date];
}

@end

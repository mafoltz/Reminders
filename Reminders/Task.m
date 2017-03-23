//
//  Task.m
//  Reminders
//
//  Created by Gunter Hertz on 22/03/17.
//  Copyright © 2017 Marcelo Andrighetto Foltz. All rights reserved.
//

#import "Task.h"

@implementation Task

- (instancetype)initWithId:(NSString *)taskID andWithTaskDate:(NSString *)taskDate andTaskHour:(NSString *)taskHour andtaskMessage:(NSString *)taskMessage
{
    self = [super init];
    if (self) {
        _isCompleted = NO;
        _taskDate = [self getDateFromDay:taskDate andHour:taskHour];
        _taskMessage = taskMessage;
        _taskID = taskID;
        
    }
    return self;
}

- (NSDate *)getDateFromDay:(NSString *)dateString andHour:(NSString *)hourString{
    NSDateFormatter *taskDateFormatter = [[NSDateFormatter alloc]init];
    [taskDateFormatter setDateFormat:@"dd/MM/yyyy HH:mm:ss "];
    NSDate *tempDate = [taskDateFormatter dateFromString:[self appendingDate:dateString andHour:hourString]];
    //return [taskDateFormatter dateFromString:[self appendingDate:dateString andHour:hourString]];
    return tempDate;
}

- (NSString *)appendingDate:(NSString *)date andHour:(NSString *)hour{
    NSMutableString *fullDate = [[NSMutableString alloc]initWithString:date];
    [fullDate appendString:@" "];
    [fullDate appendString:hour];
    [fullDate appendString:@":00"];
    //NSLog(@"%@", fullDate);
    return fullDate;
}

- (void) changeStatus {
    if(self.isCompleted)
        _isCompleted = NO;
    else
        _isCompleted = YES;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"TaskID: %@\t\tTaskDate: %@\t\tTaskMessage:%@", self.taskID,[self.taskDate descriptionWithLocale:[NSLocale systemLocale]], self.taskMessage];
}
@end


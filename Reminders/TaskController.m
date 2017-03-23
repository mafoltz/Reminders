//
//  TaskController.m
//  Reminders
//
//  Created by Gunter Hertz on 22/03/17.
//  Copyright © 2017 Marcelo Andrighetto Foltz. All rights reserved.
//

#import "TaskController.h"
#import "Task.h"

@interface TaskController ()

@property (nonatomic) NSMutableDictionary *tasks;
@property (nonatomic) NSNumber *currentTaskId;

- (NSString *)nextTaskId;

@end



@implementation TaskController

- (instancetype)init {
    self = [super init];
    if (self) {
        _tasks = [[NSMutableDictionary alloc] init];
        _tasksDictionary = [self.tasks copy];
        _currentTaskId = 0;
    }
    return self;
}

- (NSString *)nextTaskId{
    self.currentTaskId = @([self.currentTaskId integerValue] + 1);
    return [self.currentTaskId stringValue];
}

- (void)addTaskWithDate:(NSString *)taskDate Hour:taskHour andMessage:(NSString *)taskMessage {
    NSString *taskId = [self nextTaskId];
    
    [self.tasks insertValue:[[Task alloc] initWithId:taskId
                                     andWithTaskDate:taskDate
                                         andTaskHour:taskHour
                                      andtaskMessage:taskMessage]
          inPropertyWithKey:taskId];
    
    self.tasksDictionary = [self.tasks copy];
}

- (void)deleteTaskWithId:(NSString *)taskId {
    [self.tasks removeObjectForKey:taskId];
    self.tasksDictionary = [self.tasks copy];
}

@end

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
- (void)setPendingTasks;
- (void)setCompletedTasks;

@end



@implementation TaskController

- (instancetype)init {
    self = [super init];
    if (self) {
        _tasks = [[NSMutableDictionary alloc] init];
        _currentTaskId = 0;
        [self setPendingTasks];
        [self setCompletedTasks];
    }
    return self;
}

- (NSString *)nextTaskId {
    self.currentTaskId = @([self.currentTaskId integerValue] + 1);
    return [self.currentTaskId stringValue];
}

- (void)setPendingTasks {
    NSMutableArray *pendingTasks = [[NSMutableArray alloc] init];
    
    for(NSString *taskID in self.tasks){
        Task *task = self.tasks[taskID];
        if(!task.isCompleted)
            [pendingTasks addObject:task];
    }
    
    _pendingTasks = [[[NSArray alloc] initWithArray:pendingTasks] copy];
}

- (void)setCompletedTasks {
    NSMutableArray *completedTasks = [[NSMutableArray alloc] init];
    
    for(NSString *taskID in self.tasks){
        Task *task = self.tasks[taskID];
        if(task.isCompleted)
            [completedTasks addObject:task];
    }
    
    _completedTasks = [[[NSArray alloc] initWithArray:completedTasks] copy];
}

- (void)addTaskWithDate:(NSString *)taskDate Hour:(NSString *)taskHour andMessage:(NSString *)taskMessage {
    NSString *taskId = [self nextTaskId];
    
    [self.tasks setValue:[[Task alloc] initWithId:taskId
                                 andWithTaskDate:taskDate
                                     andTaskHour:taskHour
                                   andtaskMessage:taskMessage] forKey:taskId];
    
    [self setPendingTasks];
    [self setCompletedTasks];
}

- (void)changeTaskStatusWithId:(NSString *)taskId {
    //[self.tasks setObject:[[self.tasks objectForKey:taskId] changeStatus] forKey:taskId];
    [self setPendingTasks];
    [self setCompletedTasks];
}

- (void)deleteTaskWithId:(NSString *)taskId {
    [self.tasks removeObjectForKey:taskId];
    [self setPendingTasks];
    [self setCompletedTasks];
}

@end

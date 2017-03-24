//
//  TaskController.m
//  Reminders
//
//  Created by Gunter Hertz on 22/03/17.
//  Copyright © 2017 Marcelo Andrighetto Foltz. All rights reserved.
//

#import "TaskController.h"
#import "Task.h"
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

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
    NSMutableArray *pending      = [[NSMutableArray alloc] init];
    for(NSString *taskId in self.tasks){
        Task *task = self.tasks[taskId];
        if(!task.isCompleted)
            [pending addObject:task];
    }
    
    NSSortDescriptor *sortDescriptor  = [[NSSortDescriptor alloc]initWithKey:@"taskDate" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *pendingTasksSortedByDate = [pending sortedArrayUsingDescriptors:sortDescriptors];
    
    for(Task *task in pendingTasksSortedByDate){
        [pendingTasks addObject:[task description]];
        }
    _pendingTasks = [[[NSArray alloc] initWithArray:pendingTasks] copy];
}

- (void)setCompletedTasks {
    NSMutableArray *completedTasks = [[NSMutableArray alloc] init];
    
    for(NSString *taskId in self.tasks){
        Task *task = self.tasks[taskId];
        if(task.isCompleted)
            [completedTasks addObject:[task description]];
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

- (BOOL)changeTaskStatusWithId:(NSString *)taskId {
    Task *aux = self.tasks[taskId];
    if (aux){
        aux.isCompleted = !aux.isCompleted;
        [self setPendingTasks];
        [self setCompletedTasks];
        return YES;
    }
    else
        return NO;
}

- (BOOL)deleteTaskWithId:(NSString *)taskId {
    if([self.tasks objectForKey:taskId]){
        [self.tasks removeObjectForKey:taskId];
        [self setPendingTasks];
        [self setCompletedTasks];
        return YES;
    }
    else
        return NO;
}

- (BOOL)isEmpty{
    if([_tasks count] == 0)
        return YES;
    else{
        return NO;
    }
}

- (NSDate *)getNextTaskDate{
    return [_pendingTasks[0] taskDate];
}

- (BOOL)editTaskWithId:(NSString *)taskId Message:(NSString *)taskMessage {
    Task *editableTask = [self.tasks objectForKey:taskId];
    if(editableTask) {
        [editableTask setTaskMessage:taskMessage];
        [self setPendingTasks];
        [self setCompletedTasks];
        return YES;
    }
    else
        return NO;
}

- (BOOL)isAnyPendingTaks{
    if([_pendingTasks count] == 0){
        return NO;
    }else{
        return YES;
    }

}
@end

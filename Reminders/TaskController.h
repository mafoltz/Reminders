//
//  TaskController.h
//  Reminders
//
//  Created by Gunter Hertz on 22/03/17.
//  Copyright © 2017 Marcelo Andrighetto Foltz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskController : NSObject


@property (nonatomic, readonly, copy) NSArray *pendingTasks, *completedTasks;

- (instancetype)init;
- (void)addTaskWithDate:(NSString *)taskDate Hour:(NSString *)taskHour andMessage:(NSString *)taskMessage;
- (BOOL)editTaskWithId:(NSString *)taskId Message:(NSString *)taskMessage;
- (BOOL)changeTaskStatusWithId:(NSString *)taskId;
- (BOOL)deleteTaskWithId:(NSString *)taskId;
- (BOOL)isEmpty;
- (NSDate *)getNextTaskDate;
- (BOOL)isAnyPendingTaks;
- (BOOL)containsId:(NSString *)taskId;


@end

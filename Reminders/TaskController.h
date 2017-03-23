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
@property (nonatomic, readonly) NSNumber *nextTaskToNotifyId;

- (instancetype)init;
- (void)addTaskWithDate:(NSString *)taskDate Hour:(NSString *)taskHour andMessage:(NSString *)taskMessage;
- (void)deleteTaskWithId:(NSString *)taskId;

@end

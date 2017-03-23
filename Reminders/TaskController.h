//
//  TaskController.h
//  Reminders
//
//  Created by Gunter Hertz on 22/03/17.
//  Copyright © 2017 Marcelo Andrighetto Foltz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskController : NSObject


@property (nonatomic, copy) NSDictionary *tasksDictionary;
@property NSNumber *nextTaskToNotifyId;

- (instancetype)init;
- (void)addTaskWithDate:(NSString *)taskDate Hour:(NSString *)taskHour andMessage:(NSString *)taskMessage;
- (void)deleteTaskWithId:(NSString *)taskId;

@end

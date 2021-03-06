//
//  Task.h
//  Reminders
//
//  Created by Gunter Hertz on 22/03/17.
//  Copyright © 2017 Marcelo Andrighetto Foltz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (nonatomic)BOOL isCompleted;
@property (nonatomic,readonly)NSString *taskID;
@property (nonatomic,readonly)NSDate *taskDate;
@property (nonatomic)NSString *taskMessage;

- (instancetype)initWithId:(NSString *)taskID andWithTaskDate:(NSString *)taskDate andTaskHour:(NSString *)taskHour andtaskMessage:(NSString *)taskMessage;
- (void)changeStatus;

@end

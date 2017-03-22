//
//  Task.h
//  Reminders
//
//  Created by Gunter Hertz on 22/03/17.
//  Copyright © 2017 Marcelo Andrighetto Foltz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property BOOL isCompleted;
@property NSDate *taskDate;
@property NSString *taskMessage;


@end

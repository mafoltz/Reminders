//
//  ViewUI.h
//  Reminders
//
//  Created by Gabriella Barbieri on 23/03/17.
//  Copyright © 2017 Marcelo Andrighetto Foltz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskController.h"
#import "AddTaskUI.h"
#include <stdlib.h>


@interface ViewUI : NSObject

@property (nonatomic) AddTaskUI         *addTaskControl;
@property (nonatomic) TaskController    *taskController;

-(instancetype) init;
-(void) startReminder;

@end

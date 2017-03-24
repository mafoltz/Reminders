//
//  ViewUI.m
//  Reminders
//
//  Created by Gabriella Barbieri on 23/03/17.
//  Copyright © 2017 Marcelo Andrighetto Foltz. All rights reserved.
//

#import "ViewUI.h"


@implementation ViewUI

-(instancetype) init {
    self = [super init];
    if (self){
        _taskController = [[TaskController alloc] init];
        _addTaskControl = [[AddTaskUI alloc] init];
    }
    return self;
    
}

// Starts the program
-(void) startReminder {
    
    BOOL isInProgram = YES;
    int option1;
    //VER NSTIMER
    //NSTimer *timerToTask;
    //NSDate *t1 = [self.taskController getNextTaskDate];
    //NSDate *t2 = [NSDate date];
//    if(!self.taskController isEmpty){
//        NSTimeInterval *timeBetweenDates = [[self.taskController getNextTaskDate] timeIntervalSinceDate:[NSDate date]];
//    }
    
    
    while(isInProgram){
        //Prints the initial menu
        NSLog(@"----------------------------------------------------------------");
        NSLog(@"--------------------------REMINDER------------------------------");
        NSLog(@"----------------------------------------------------------------");
        NSLog(@"----------------------------------------------------------------");
        NSLog(@"--------------------  1-Add Reminder    ------------------------");
        NSLog(@"--------------------  2-Show Task List  ------------------------");
        NSLog(@"--------------------  3-Mark Task       ------------------------");
        NSLog(@"--------------------  4-Delete Task     ------------------------");
        NSLog(@"--------------------  5-Exit            ------------------------");
        NSLog(@"----------------------------------------------------------------");
        NSLog(@"----------------------------------------------------------------");
        NSLog(@"----------------------------------------------------------------");
        
        printf("Command > ");
        scanf("%d", &option1);
        switch (option1) {
            case 1:
                [self addTask];
                getchar();
                break;
            case 2:
                [self printTaskListMenu];
                getchar();
                break;
            case 3:
                [self markTask];
                getchar();
                break;
            case 4:
                [self deleteTask];
                getchar();
                break;
            case 5:
                isInProgram = NO;
                system("clear");
                getchar();
                break;
            default:
                NSLog(@"This option is not defined! Type an existing option.");
                break;
        }
    }
    NSLog(@"Thanks for using it!! Please, rate this app.");
}


-(void) addTask {
    [self.addTaskControl taskMenu];
    [self.taskController addTaskWithDate:self.addTaskControl.date Hour:self.addTaskControl.time andMessage:self.addTaskControl.taskMsg];
}

-(void) printTaskListMenu {
    if([_taskController isEmpty]){
        NSLog(@"There is no task!");
    }else{
        NSLog(@"----------------------------------------------------------------");
        NSLog(@"---------------  1-Show Only Not Completed   -------------------");
        NSLog(@"---------------  2-Show All                  -------------------");
        NSLog(@"----------------------------------------------------------------");
        int option;
        printf("Command> ");
        scanf("%d", &option);
        
        switch(option){
            case 1:
                [self printNotCompleted];
                break;
            case 2:
                [self printNotCompleted];
                [self printCompleted];
                break;
        }

    }
}

-(void) printNotCompleted {
    NSArray *taskList = self.taskController.pendingTasks;
    for (NSString *task in taskList){
        NSLog(@"%@", task);
        
    }
}

-(void) printCompleted {
    NSArray *taskList = self.taskController.completedTasks;
    for (NSString *task in taskList){
        NSLog(@"%@", task);
        
    }
}


- (void)deleteTask{
    int taskIdToDelete;
    if([_taskController isEmpty]){
        NSLog(@"There is no task!");
    }else{
        [self printNotCompleted];
        [self printCompleted];
        NSLog(@"Type an task ID to delete");
        printf("Command> ");
        scanf("%d", &taskIdToDelete);
        [self.taskController deleteTaskWithId:[NSString stringWithFormat:@"%d", taskIdToDelete]];
    }
}

- (void) markTask {
    int taskIDToMark;
    if([_taskController isEmpty]){
        NSLog(@"There is no task!");
    }else{
        [self printNotCompleted];
        [self printCompleted];
        NSLog(@"Type an task ID to mark as done");
        printf("Command> ");
        scanf("%d", &taskIDToMark);
        [self.taskController changeTaskStatusWithId:[NSString stringWithFormat:@"%d", taskIDToMark]];
    }
}

@end

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
        NSLog(@"--------------------  5-Edit Task       ------------------------");
        NSLog(@"--------------------  6-Exit            ------------------------");
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
                if([_taskController isEmpty]){
                    NSLog(@"There is no task!");
                    break;
                }else{
                [self printTaskListMenu];
                getchar();
                break;
                }
            case 3:
                if([_taskController isEmpty]){
                    NSLog(@"There is no task!");
                    break;
                }else{
                    [self markTask];
                    getchar();
                    break;
                }
            case 4:
                if([_taskController isEmpty]){
                    NSLog(@"There is no task!");
                    break;
                }else{
                    [self deleteTask];
                    getchar();
                    break;
                }
            case 5:
                if([_taskController isEmpty]){
                    NSLog(@"There is no task");
                    break;
                }else{
                    [self editTaskMenu];
                    break;
                }
            case 6:
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
        NSLog(@"----------------------------------------------------------------");
        NSLog(@"---------------  1-Show Only Not Completed   -------------------");
        NSLog(@"---------------  2-Show All                  -------------------");
        NSLog(@"----------------------------------------------------------------");
        int option;
        printf("Command> ");
        scanf("%d", &option);
        
        switch(option){
            case 1:
                if([_taskController isAnyPendingTaks]){
                    NSLog(@"Pending Tasks:");
                    [self printNotCompleted];
                    break;
                }else{
                    NSLog(@"There is no pending tasks.");
                    break;
                }
            case 2:
                NSLog(@"Pending Tasks:");
                [self printNotCompleted];
                NSLog(@"Completed Tasks:");
                [self printCompleted];
                break;
            default:
                NSLog(@"This option is not defined! Type an existing option.");
                break;
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
        [self printNotCompleted];
        [self printCompleted];
        NSLog(@"Type an task ID to delete");
        printf("Command> ");
        scanf("%d", &taskIdToDelete);
        
        // Prints an error message in case the given ID does not exist
        //if ([self.taskController deleteTaskWithId:[NSString stringWithFormat:@"%d", taskIdToDelete]]){
        if([self.taskController deleteTaskWithId:[[[NSNumber alloc] initWithInt:taskIdToDelete] stringValue]]){
            NSLog(@"Task deleted!");
        }
        else {
            NSLog(@"The ID given does not exist! Please, type a valid one!");
        }
}

- (void)editTaskMenu{
    //imprimir lista de tasks
    //selecionar id
    //editar texto
    int wantedTask;
    [self printNotCompleted];
    [self printCompleted];
    printf("Type an task ID to edit: ");
    scanf("%d", &wantedTask);
    char buffer[100];
    
    printf("Message: ");
    scanf("%s", buffer);
    [_taskController editTaskWithId:[NSString stringWithFormat:@"%d", wantedTask]
                            Message:[NSString stringWithCString:buffer encoding:NSUTF8StringEncoding]];
    
}

- (void) markTask {
    int taskIDToMark;
        [self printNotCompleted];
        [self printCompleted];
        NSLog(@"Type an task ID to mark as done");
        printf("Command> ");
        scanf("%d", &taskIDToMark);
        // Prints an error message in case the given ID does not exist
        if([self.taskController changeTaskStatusWithId:[NSString stringWithFormat:@"%d", taskIDToMark]]){
            NSLog(@"Task marked as done!");
        }
        else{
            NSLog(@"The ID given does not exist!");
        }
}

@end

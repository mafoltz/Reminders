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
    
    while(isInProgram){
        //Prints the initial menu
        NSLog(@"----------------------------------------------------------------");
        NSLog(@"--------------------------REMINDERS-----------------------------");
        NSLog(@"----------------------------------------------------------------");
        NSLog(@"----------------------------------------------------------------");
        NSLog(@"--------------------  1-Add Reminders   ------------------------");
        NSLog(@"--------------------  2-Show Task List  ------------------------");
        NSLog(@"--------------------  3-Exit            ------------------------");
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
            [self printNotCompleted];
    }
    
    
}

-(void) printNotCompleted {
    NSArray *taskList = self.taskController.pendingTasks;
    for (NSString *task in taskList){
        NSLog(@"%@", task);
        
    }
}




@end

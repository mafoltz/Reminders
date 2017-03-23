//
//  ViewUI.m
//  Reminders
//
//  Created by Gabriella Barbieri on 23/03/17.
//  Copyright © 2017 Marcelo Andrighetto Foltz. All rights reserved.
//

#import "ViewUI.h"
#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

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
        
        NSLog(@"Type what you want: ");
        scanf("%d", &option1);
        switch (option1) {
            case 1:
                system("clear");
                [self addTask];
                getchar();
                break;
            case 2:
                NSLog(@"SHOW TASK LIST");
                system("clear");
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




@end

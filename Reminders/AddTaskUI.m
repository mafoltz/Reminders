//
//  AddTaskUI.m
//  Reminders
//
//  Created by Gunter Hertz on 22/03/17.
//  Copyright © 2017 Marcelo Andrighetto Foltz. All rights reserved.
//

#import "AddTaskUI.h"

@implementation AddTaskUI


-(void) taskMenu {
    // Keyboard buffer
    char buffer[200];
    
    printf("Message: ");
    fgets(buffer,100,stdin);
    NSString *taskMessage =[NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];
    _taskMsg = [taskMessage substringToIndex:([taskMessage length] - 1)];
    
    
    printf("Date (dd/MM/yyyy): ");
    scanf("%s", buffer);
    _date = [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];
    
    
    printf("Time (HH:mm): ");
    scanf("%s", buffer);
    _time = [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];
    
}

@end

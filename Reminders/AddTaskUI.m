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
    char buffer[100];
    
    NSLog(@"Message:");
    scanf("%s", buffer);
    _taskMsg = [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];
    
    
    NSLog(@"Date:");
    scanf("%s", buffer);
    _date = [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];
    
    
    NSLog(@"Time:");
    scanf("%s", buffer);
    _time = [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];
    
}

@end

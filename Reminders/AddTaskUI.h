//
//  AddTaskUI.h
//  Reminders
//
//  Created by Gunter Hertz on 22/03/17.
//  Copyright © 2017 Marcelo Andrighetto Foltz. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface AddTaskUI : NSObject

@property (nonatomic, readonly) NSString* taskMsg;
@property (nonatomic, readonly) NSString* date;
@property (nonatomic, readonly) NSString* time;


-(void) taskMenu;

@end

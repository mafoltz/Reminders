//
//  main.m
//  Reminders
//
//  Created by Marcelo Andrighetto Foltz on 22/03/17.
//  Copyright © 2017 Marcelo Andrighetto Foltz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdlib.h>
#import "SummaryUI.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SummaryUI *canvas;
        canvas = [[SummaryUI alloc]init];
        [canvas printInitialMenu];
        getchar();
    
        system("clear");
//        NSLog(@"git add .");
        // git commit -m "Descrição do commit"
        // git push
        
    }
    return 0;
}

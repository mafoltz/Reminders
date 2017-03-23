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
        BOOL isInProgram = YES;
        //NSNumber *option = [[NSNumber alloc]init];
        int option1;
        
        SummaryUI *canvas;
        
        while(isInProgram){
            //getchar();
            canvas = [[SummaryUI alloc]init];
            [canvas printInitialMenu];
            NSLog(@"Type what you want: ");
            scanf("%d", &option1);
            switch (option1) {
                case 1:
                    NSLog(@"ADD TASK");
                    system("clear");
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
        NSLog(@"fim!!");
        
//        NSLog(@"git add .");
        // git commit -m "Descrição do commit"
        // git push
        
    }
    return 0;
}

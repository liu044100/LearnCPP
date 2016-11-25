//
//  main.m
//  LearnCPP
//
//  Created by yuchen liu on 22/11/2016.
//  Copyright © 2016 rain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

/* change parameter to string */
#define  message_for(a, b)  \
printf(#a " and " #b ": We love you!\n")

/* join two separate tokens into one */
#define tokenpaster(n) printf ("token" #n " = %d", token##n)

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        message_for("$", "time");
        int token34 = 40;
        tokenpaster(34);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

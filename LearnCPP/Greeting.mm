//
//  Greeting.m
//  LearnCPP
//
//  Created by yuchen liu on 23/11/2016.
//  Copyright © 2016 rain. All rights reserved.
//

#import "Greeting.h"

class Hello {
private:
    id greeting_text;  // holds an NSString
public:
    Hello() {
        greeting_text = @"Hello, world!";
    }
    Hello(const char* initial_greeting_text) {
        greeting_text = [[NSString alloc] initWithUTF8String:initial_greeting_text];
    }
    void say_hello() {
        // UTF8String is C string, so use %s
        printf("%s\n", [greeting_text UTF8String]);
    }
};

@interface Greeting() {
@private
    Hello *hello;
}
- (id)init;
- (void)dealloc;
- (void)sayGreeting;
- (void)sayGreeting:(Hello*)greeting;
@end

@implementation Greeting
- (id)init {
    self = [super init];
    if (self) {
        hello = new Hello();
    }
    return self;
}
- (void)dealloc {
    delete hello;
}

- (void)sayGreeting {
    hello->say_hello();
}
- (void)sayGreeting:(Hello*)greeting {
    greeting->say_hello();
}
@end

//
//  ViewController.m
//  LearnCPP
//
//  Created by yuchen liu on 22/11/2016.
//  Copyright © 2016 rain. All rights reserved.
//

#import "ViewController.h"

#import <vector>
#import <string>
#import <iostream>

@interface ViewController ()

@end

@implementation ViewController

CGSize operator/(const CGSize &lhs, CGFloat f) {
    return (CGSize){lhs.width / f, lhs.height / f};
}

class DoubleInt {
private:
    int x;
    int y;
public:
    DoubleInt(int x, int y) : x(x), y(y) {}
    DoubleInt operator+(const DoubleInt &rhs) {
        return DoubleInt(x + rhs.x, y + rhs.y);
    }
    DoubleInt operator+(const int &rhs) {
        return DoubleInt(x + rhs, y + rhs);
    }
};

using namespace std;
class Person {
public:
    Person(string name):name(name){};
    void doADance() {
        cout << this->name << "dance!!!" << endl;
    }
private:
    string name;
};


- (void)testCPP {
    
    // auto
    
    // Inline blocks
    auto processAnnotation = ^(NSDate *date, BOOL addToIndex, NSUInteger objectID) {
        return @"";
    };
    
    // let
    const auto password = @"test123";
    
    
    // vector
    auto points = std::vector<CGPoint>{{0, 0}, {.x=32, .y=32}, {32, 0}};
    auto points_2 = std::vector<CGPoint>{{0, 0}, {32, 32}, {32, 0}};
    
    // Operator overloading
    CGFloat zoomScale = 2.0;
    const CGSize zoomSize = self.view.bounds.size / zoomScale;
    
    // Operator one more: right hand side
    DoubleInt a(1, 2);
    DoubleInt b(3, 4);
    DoubleInt c = a + b;
    DoubleInt d = c + 10;
    
    // Variable declaration in if
    if (const auto nav = self.navigationController) {
        
    }
    
    std::vector<int> v;
    v.push_back(1);
    v.push_back(2);
    v.push_back(3);
    v.push_back(4);
    v.push_back(5);
    
    int first = v[1];
    int outOfBounds = v.at(100);
    
    // shared point
    std::shared_ptr<int> p1(new int(1)); ///< Use count = 1
    
    BOOL doSomething = YES;
    if (doSomething) {
        std::shared_ptr<int> p2 = p1; ///< Use count = 2;
        // Do something with p2
    }
    
    // p2 has gone out of scope and destroyed, so use count = 1
    
    p1.reset();
    
    // p1 reset, so use count = 0
    // The underlying int* is deleted
    
    std::shared_ptr<Person> person1(new Person("Matt Galloway"));
    person1->doADance(); ///< Make Matt dance
    
    // dereference
    Person person2 = *person1;
    person2.doADance();
    
    // virtual == Protocol Extension in swift
    
    // template == Generic Type in swift
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

@end

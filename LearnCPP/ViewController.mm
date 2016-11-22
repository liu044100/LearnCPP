//
//  ViewController.m
//  LearnCPP
//
//  Created by yuchen liu on 22/11/2016.
//  Copyright © 2016 rain. All rights reserved.
//

#import "ViewController.h"

#import <vector>

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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

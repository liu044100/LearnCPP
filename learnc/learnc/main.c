//
//  main.c
//  learnc
//
//  Created by yuchen liu on 2018/04/15.
//  Copyright © 2018 yuchen liu. All rights reserved.
//

#include <stdio.h>

#define NUM1 10
#define NUM2 20

int main(int argc, const char * argv[]) {
    int a1=20, a2=345, a3=700, a4=22;
    int b1=56720, b2=9999, b3=20098, b4=2;
    int c1=233, c2=205, c3=1, c4=6666;
    int d1=34, d2=0, d3=23, d4=23006783;
    
    // - means left align, 9 means placeholder
    printf("%-9d %-9d %-9d %-9d\n", a1, a2, a3, a4);
    printf("%-9d %-9d %-9d %-9d\n", b1, b2, b3, b4);
    printf("%-9d %-9d %-9d %-9d\n", c1, c2, c3, c4);
    printf("%-9d %-9d %-9d %-9d\n", d1, d2, d3, d4);
    
    int a[4] = {20, 345, 700, 22};
    int b[4] = {56720, 9999, 20098, 2};
    int c[4] = {233, 205, 1, 6666};
    int d[4] = {34, 0, 23, 23006783};

    printf("%-9d %-9d %-9d %-9d\n", a[0], a[1], a[2], a[3]);
    printf("%-9d %-9d %-9d %-9d\n", b[0], b[1], b[2], b[3]);
    printf("%-9d %-9d %-9d %-9d\n", c[0], c[1], c[2], c[3]);
    printf("%-9d %-9d %-9d %-9d\n", d[0], d[1], d[2], d[3]);
    
//    // 对单个元素赋值
//    int a[3];
//    a[0] = 3;
//    a[1] = 100;
//    a[2] = 34;
//    // 整体赋值（不指明数组长度）
//    float b[] = { 23.3, 100.00, 10, 0.34 };
//    // 整体赋值（指明数组长度）
//    int m[10] = { 100, 30, 234 };
//    // 字符数组赋值
//    char str1[] = "http://c.biancheng.net";
//    // 将数组所有元素都初始化为0
//    int arr[10] = {0};
//    char str2[20] = {0};
    

    // #ifdef 可以认为是 #if defined 的缩写。
#if (defined NUM1 && defined NUM2)
    //代码A
    printf("NUM1: %d, NUM2: %d\n", NUM1, NUM2);
#else
    //代码B
    printf("Error\n");
#endif
    
    return 0;
}

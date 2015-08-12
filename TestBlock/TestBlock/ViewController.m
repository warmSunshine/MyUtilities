//
//  ViewController.m
//  TestBlock
//
//  Created by qianfeng on 15/8/8.
//  Copyright (c) 2015年 pzl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //变量的使用
    //声明
    int a;
    //赋值
    a=10;
    //使用
    NSLog(@"%d",a);

//    [self testNoReturnValue];
//    [self testIntReturnValue];
//    [self testNSStringReturnValue];
    [self test];
    
    
    //需要修改外部变量的值
 
}
-(void)test
{
//1.没有返回值 参数为对象类型
    void (^block)(NSString *param)=^(NSString *param){
        NSLog(@"%@",param);
    };
    block(@"test");

//2.返回值为对象类型 两个基本类型的参数
    NSString *(^block2)(int,int)=^(int a,int b){
        return [NSString stringWithFormat:@"%d",a+b];
    };
  NSString *ret=block2(1,5);
    NSLog(@"%@",ret);
}
//没有返回值的
-(void)testNoReturnValue
{
    //1.没有参数
    //声明
    void (^block)(void);
    //赋值
    block=^{
        NSLog(@"void");
    };
    //使用
    block();

    
    
    //2.有一个参数,参数是基本类型
    //声明
    //可以省略形参名
    //void (^block2)(int)
    //声明时的形参可以和赋值时不一样
    void (^block2)(int pa);
    //赋值
    block2=^(int param){
        NSLog(@"param=%d",param);
    };
    //使用
    block2(30);
    
    
//    3.有一个参数,参数是对象类型(NSString)
    //声明
    void (^block3)(NSString *);
    //赋值
    block3=^(NSString *name){
        NSLog(@"name=%@",name);
    };
    //使用
    block3(@"小明");
    
    
    //4.有两个参数,一个基本类型,一个对象类型
    //声明
    void (^block4)(int,NSString *);
    //赋值
    block4=^(int age,NSString *name){
        NSLog(@"age=%d,name=%@",age,name);
    };
    //使用
    block4(23,@"小明");
}


//有返回值  返回值为基本类型
-(void)testIntReturnValue
{
//1.没有参数的
    //声明
    int (^block1)(void);
    
    //赋值
    block1=^{
        return 200;
    };
//使用
    int ret1=block1();
    NSLog(@"ret1=%d",ret1);

//    2.有一个参数 参数为基本类型
    //声明
    int (^block2)(int);
    //赋值
    block2=^(int age){
        return age;
    };
    
    //使用
    int ret2=block2(20);
    NSLog(@"ret2=%d",ret2);
    
    //3.有一个参数,参数为对象类型
    //声明
    int (^block3)(NSString *);
    //赋值
    block3=^(NSString *name){
        return (int)name.length;
    };
    //使用
    int ret3=block3(@"hello block");
    NSLog(@"ret3=%d",ret3);
    
    
    //4.有两个参数,两个对象类型
    //声明
    int (^block4)(NSString *,NSString *);
    //赋值
    block4=^(NSString *name1,NSString *name2){
        return (int)(name1.length+name2.length);
    };
    
    //使用
    int ret4= block4(@"小明",@"小红");
    NSLog(@"ret4=%d",ret4);
    
}
//有返回值 返回值为对象类型(NSString)
-(void)testNSStringReturnValue
{
//1.没有参数
    //声明
    NSString *(^block1)(void);
    //赋值
    block1=^{
    return @"你好";
    };
    //使用
    NSString *ret1=block1();
    NSLog(@"ret1=%@",ret1);
    
//2.有一个参数,参数为基本类型
    //声明
    NSString *(^block2)(int);
    
    //赋值
    block2=^(int age){
        return [NSString stringWithFormat:@"我今年%d岁了",age];
    };
    
    //使用
    NSString *ret2=block2(23);
    NSLog(@"ret2=%@",ret2);
    
//3.有一个参数,参数为对象类型
    //声明
    NSString *(^block3)(NSString *);
    
    //赋值
    block3=^(NSString *name){
        return name;
    };
    //使用
   NSString *ret3= block3(@"小明");
    NSLog(@"ret3=%@",ret3);
//4.有两个参数,参数为对象类型
    //声明
    NSString *(^block4)(NSString *,NSString *);
    //赋值
    block4=^(NSString *name1,NSString *name2){
    
        return [NSString stringWithFormat:@"%@,%@",name1,name2];
    };
    //使用
    NSString *ret4=block4(@"小明",@"小红");
    NSLog(@"ret4=%@",ret4);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

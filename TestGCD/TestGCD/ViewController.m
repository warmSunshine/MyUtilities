//
//  ViewController.m
//  TestGCD
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
    //GCD
    //队列
    
    //串行队列
    //前面的线程执行完成,才会开始执行后面加入的线程
    
    //并行队列
    
    //前面加入的线程和后面加入的线程同时执行
    
    //1.主线程所在的串行队列
    //系统自动创建这个队列,直接使用就行
    dispatch_queue_t mainQueue=dispatch_get_main_queue();
    
//    2.全局的并行队列
//    系统自动创建这个队列,直接使用就行
    /*
     第一个参数:队列的优先级
     第二个参数:Apple公司保留的参数,传0;
     
     */
    dispatch_queue_t globalQueue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //3.自己创建的队列
    //1)串行队列
    /*
     第一个参数:队列的标识符
     第二个参数:队列的类型(是串行还是并行)
     DISPATCH_QUEUE_SERIAL 表示是串行队列
     */
    dispatch_queue_t serialQueue=dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
    
    //2)并行队列
//    DISPATCH_QUEUE_CONCURRENT表示并行队列
    dispatch_queue_t concurrentQueue=dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    
    
    
    
    
    //使用GCD创建线程
    /*
     第一个参数:线程执行的队列
     第二个参数:线程的执行体
     
     */
//    1.同步的提交方式
    dispatch_sync(globalQueue, ^{
        for (int i=0; i<100; i++) {
            NSLog(@"线程一:%d",i);
        }
    });
    //2.异步的提交方式
    dispatch_async(globalQueue, ^{
        for (int i=0; i<100; i++) {
            NSLog(@"线程二:%d",i);
        }
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

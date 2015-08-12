//
//  ViewController.m
//  适配
//
//  Created by qianfeng on 15/8/11.
//  Copyright (c) 2015年 pzl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *_redView;
    UIView *_blueView;
    UIView *_orangeView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
    _redView=[[UIView alloc]initWithFrame:CGRectMake(20, 20, self.view.frame.size.width-40, 40)];
    _redView.backgroundColor=[UIColor redColor];
    
    _redView.autoresizingMask=UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_redView];
    
    _blueView=[[UIView alloc]initWithFrame:CGRectMake(20, 80, (self.view.frame.size.width/2)-40, self.view.frame.size.height-100)];
    _blueView.backgroundColor=[UIColor blueColor];
    _blueView.autoresizingMask=UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_blueView];
    
    _orangeView=[[UIView alloc]initWithFrame:CGRectMake(20+(self.view.frame.size.width/2), 80, (self.view.frame.size.width/2)-40, self.view.frame.size.height-100)];
    _orangeView.backgroundColor=[UIColor orangeColor];
 
    _orangeView.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_orangeView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

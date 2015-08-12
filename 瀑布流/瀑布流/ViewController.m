//
//  ViewController.m
//  瀑布流
//
//  Created by qianfeng on 15/8/7.
//  Copyright (c) 2015年 pzl. All rights reserved.
//

#import "ViewController.h"
#import "MyLayout.h"
#import "DataModel.h"
#import "DataCell.h"
#define kCellId @"cellId"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,MyLayoutDelegate>
{
//数据源数组
    NSMutableArray *_dataArray;
    //网格视图
    UICollectionView *_collectionView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //数据源
    [self createData];
    //网格视图
    [self createCollectionView];
    
}
//数据源
-(void)createData
{
    _dataArray=[NSMutableArray array];
    for (int i=0; i<100; i++) {
        DataModel *model=[DataModel new];
        model.title=[NSString stringWithFormat:@"第%d个数据",i+1];
        model.height=40+arc4random()%60;
        [_dataArray addObject:model];
    }
}
//网格视图
-(void)createCollectionView
{
//布局对象
    MyLayout *layout=[[MyLayout alloc]initWithSectionInsets:UIEdgeInsetsMake(5, 5, 5, 5) ItemSpace:10 lineSpace:10];
    layout.delegate=self;
    
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 20, 375, 667-20) collectionViewLayout:layout];
   //代理
    _collectionView.delegate=self;
    _collectionView.dataSource=self;

    //背景
    _collectionView.backgroundColor=[UIColor whiteColor];
    
    //注册
    [_collectionView registerNib:[UINib nibWithNibName:@"DataCell" bundle:nil] forCellWithReuseIdentifier:kCellId];
    
    [self.view addSubview:_collectionView];
}

#pragma mark----UICollectionView代理

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DataCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:kCellId forIndexPath:indexPath];
    
    DataModel *model=_dataArray[indexPath.item];
 //显示数据
    [cell config:model];
    cell.backgroundColor=[UIColor cyanColor];
    
    return cell;
}
#pragma  mark----MyLayout代理
-(NSInteger)numberOfColumns
{

    return 3;
}
-(CGFloat)heightForCellAtIndexPath:(NSIndexPath *)indexPath
{
    DataModel *model=_dataArray[indexPath.item];
    return model.height;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  MyLayout.m
//  瀑布流
//
//  Created by qianfeng on 15/8/7.
//  Copyright (c) 2015年 pzl. All rights reserved.
//

#import "MyLayout.h"

@implementation MyLayout
{
    UIEdgeInsets _sectionInsets;
    
    //cell横向间距
    CGFloat _itemSpace;
    
    //cell纵向间距
    CGFloat _lineSpace;
    
    //列数
    NSInteger _column;
    //存储每列的当前高度
    NSMutableArray *_columnArray;

//存储frame值的对象的数组
    NSMutableArray *_attrArray;
}
-(instancetype)initWithSectionInsets:(UIEdgeInsets)sectionInsets ItemSpace:(CGFloat)itemSpace lineSpace:(CGFloat)lineSpace
{
    self=[super init];
    if (self) {
        _sectionInsets=sectionInsets;
        _itemSpace=itemSpace;
        _lineSpace=lineSpace;
        
        //默认为两列
        _column=2;
        
        _columnArray=[NSMutableArray array];
        
        _attrArray=[NSMutableArray array];
    }
    return self;
}
//每次重新布局时都会调用的方法
-(void)prepareLayout
{
    [super prepareLayout];
    
    //删除之前的数据
    [_columnArray removeAllObjects];
    [_attrArray removeAllObjects];
    //获取列数
    _column=[self.delegate numberOfColumns];

    for (int i=0; i<_column; i++) {
        NSNumber *n=[NSNumber numberWithFloat:_sectionInsets.top];
        [_columnArray addObject:n];
    }
    
    //计算每个cell的frame
    CGFloat w=(self.collectionView.bounds.size.width-_sectionInsets.left-_sectionInsets.right-_itemSpace*(_column-1))/_column;
    
    //一共有多少个cell
    NSInteger cellCnt=[self.collectionView numberOfItemsInSection:0];
    
    for (int i=0; i<cellCnt; i++) {
        //列数
        NSInteger col=[self lowestColumnIndex];
        //x
        //sectionInset.left
        //sectionInset.left+(w+itemSpace)
        //sectionInset.left+(w+itemSpace)+(w+itemSpace)
        CGFloat x=_sectionInsets.left+(w+_itemSpace)*col;
        
        //h
        NSIndexPath *indexPath=[NSIndexPath indexPathForItem:i inSection:0];
        CGFloat h=[self.delegate heightForCellAtIndexPath:indexPath];

        //y
        CGFloat y=[_columnArray[col] floatValue];
        
        //更新y值
        _columnArray[col]=[NSNumber numberWithFloat:y+h+_lineSpace];
        
        //创建对象
        UICollectionViewLayoutAttributes *attr=[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attr.frame=CGRectMake(x, y, w, h);
        
        [_attrArray addObject:attr];
    }
}
//获取当前最短高度的列序号
-(NSInteger)lowestColumnIndex
{
    NSInteger index=-1;
    CGFloat minValue=CGFLOAT_MAX;
    for (int i=0; i<_columnArray.count; i++) {
        NSNumber *n=_columnArray[i];
        
        if (n.floatValue<minValue) {
            index=i;
            minValue=n.floatValue;
        }
    }
    return index;
}
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return _attrArray;
}
//返回网格视图的滚动大小
-(CGSize)collectionViewContentSize
{
//计算高度
    CGFloat h=[self maxHetght];
    return CGSizeMake(self.collectionView.bounds.size.width, h);
}

//获取当前最大高度列的高度值
-(CGFloat)maxHetght
{
    CGFloat maxValue=CGFLOAT_MIN;
    for (int i=0; i<_columnArray.count; i++) {
        NSNumber *n=_columnArray[i];
        if (n.floatValue>maxValue) {
            maxValue=n.floatValue;
        }
    }
    return maxValue;
}
@end

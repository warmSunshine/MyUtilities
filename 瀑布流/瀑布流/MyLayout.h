//
//  MyLayout.h
//  瀑布流
//
//  Created by qianfeng on 15/8/7.
//  Copyright (c) 2015年 pzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyLayoutDelegate <NSObject>

//列数

-(NSInteger)numberOfColumns;

-(CGFloat)heightForCellAtIndexPath:(NSIndexPath *)indexPath;
@end


@interface MyLayout : UICollectionViewLayout
//sectionInsets:上下左右的间距
//itemSpqce:cell的横向间距
//lineSpace:cell的纵向间距
-(instancetype)initWithSectionInsets:(UIEdgeInsets)sectionInsets ItemSpace:(CGFloat)itemSpace lineSpace:(CGFloat)lineSpace;
//代理属性
@property(nonatomic,weak)id<MyLayoutDelegate>delegate;
@end

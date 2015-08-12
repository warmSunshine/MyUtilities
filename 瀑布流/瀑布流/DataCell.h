//
//  DataCell.h
//  瀑布流
//
//  Created by qianfeng on 15/8/7.
//  Copyright (c) 2015年 pzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
@interface DataCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


-(void)config:(DataModel *)model;
@end

//
//  DataCell.m
//  瀑布流
//
//  Created by qianfeng on 15/8/7.
//  Copyright (c) 2015年 pzl. All rights reserved.
//

#import "DataCell.h"

@implementation DataCell

-(void)config:(DataModel *)model
{
    self.titleLabel.text=model.title;
}


- (void)awakeFromNib {
    // Initialization code
}

@end

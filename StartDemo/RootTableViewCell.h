//
//  RootTableViewCell.h
//  StartDemo
//
//  Created by anywhere on 15/8/12.
//  Copyright (c) 2015年 anywhere. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *iconImage;/**< 图标*/
@property(nonatomic,strong)UILabel *nameLabel;/**< 总述*/
@property(nonatomic,strong)UILabel *detailNameLabel;/**< 详细描述*/

-(void)cellForDataFromDic:(NSDictionary *)dict;

@end

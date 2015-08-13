//
//  RootTableViewCell.m
//  StartDemo
//
//  Created by anywhere on 15/8/12.
//  Copyright (c) 2015年 anywhere. All rights reserved.
//

#import "RootTableViewCell.h"

@implementation RootTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 50, 50)];
        self.iconImage.layer.cornerRadius =  25;
        self.iconImage.layer.masksToBounds = YES;
//        self.iconImage.backgroundColor = [UIColor redColor];
        [self addSubview:self.iconImage];
        
        
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.iconImage.right + 10, 10, self.width - self.iconImage.right - 25, 20)];
        self.nameLabel.font = [UIFont systemFontOfSize:22];
        self.nameLabel.textColor = [UIColor brownColor];
        [self addSubview:self.nameLabel];
        
        self.detailNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.iconImage.right + 10, self.nameLabel.bottom + 5, self.width - self.iconImage.right - 25, 20)];
        self.detailNameLabel.font = [UIFont systemFontOfSize:14];
        self.detailNameLabel.textColor = [UIColor orangeColor];
        self.detailNameLabel.numberOfLines = 1;
        self.detailNameLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [self addSubview:self.detailNameLabel];
    }
    return self;
}

-(void)cellForDataFromDic:(NSDictionary *)dict{
    if ([dict[@"imageurl"] hasPrefix:@"http"]) {
        [self.iconImage setImageWithURL:[NSURL URLWithString:dict[@"imageurl"]]];
    }else{
      self.iconImage.image = [UIImage imageNamed:dict[@"imageurl"]];
    }
    
    self.nameLabel.text = dict[@"name"];
    self.detailNameLabel.text = dict[@"detailName"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

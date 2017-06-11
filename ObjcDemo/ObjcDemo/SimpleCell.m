//
//  SimpleCell.m
//  ObjcDemo
//
//  Created by lieon on 2017/6/11.
//  Copyright © 2017年 ChangHongCloudTechService. All rights reserved.
//

#import "SimpleCell.h"

@interface SimpleCell()
@property(nonatomic, strong) UILabel * lable;

@end

@implementation SimpleCell

- (UILabel *)lable {
    if (_lable == nil) {
        _lable = [[UILabel alloc]init];
        _lable.frame = self.bounds;
        _lable.textColor = [UIColor redColor];
    }
    return _lable;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ( self) {
        [self.contentView addSubview:self.lable];
    }
    return self;
}

- (void)configCell:(NSString *) text {
    self.lable.text = text;
}
@end

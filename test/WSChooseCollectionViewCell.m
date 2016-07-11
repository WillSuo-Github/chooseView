//
//  WSChooseCollectionViewCell.m
//  test
//
//  Created by ws on 16/7/11.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "WSChooseCollectionViewCell.h"

@implementation WSChooseTitleModel



@end


@interface WSChooseCollectionViewCell ()

@property (nonatomic, weak)UILabel *titleLabel;
@end

@implementation WSChooseCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self setUpSubViews];
    }
    
    return self;
}

- (void)setUpSubViews{
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel = titleLabel;
    titleLabel.textColor = [UIColor blackColor];
    [self addSubview:titleLabel];
}

- (void)setModel:(WSChooseTitleModel *)model{
    
    _model = model;
    self.titleLabel.text = model.title;
    self.titleLabel.textColor = model.titleColor;

    
    UIView *backView;
    if ([model.titleColor isEqual:[UIColor whiteColor]]) {
        
        backView = [[UIView alloc] initWithFrame:self.bounds];
        backView.backgroundColor = [UIColor orangeColor];
        backView.layer.cornerRadius = backView.bounds.size.width / 2;
        backView.layer.masksToBounds = YES;
    }else{
        backView = [[UIView alloc] init];
    }
    
    [self setBackgroundView:backView];
}



@end

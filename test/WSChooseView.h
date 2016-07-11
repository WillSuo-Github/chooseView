//
//  WSChooseView.h
//  test
//
//  Created by ws on 16/7/11.
//  Copyright © 2016年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WSChooseView;
@protocol WSChooseViewDelegate <NSObject>

@optional
- (void)WSChooseView:(WSChooseView *)chooseView DidChickItemAtIndex:(NSInteger)index;

@end

@interface WSChooseView : UIView

- (instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray<NSString *> *)titleArr;


@property (nonatomic, assign)NSInteger canShowCount;
@property (nonatomic, weak)id<WSChooseViewDelegate> delegate;

@end

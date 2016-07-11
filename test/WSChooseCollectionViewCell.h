//
//  WSChooseCollectionViewCell.h
//  test
//
//  Created by ws on 16/7/11.
//  Copyright © 2016年 ws. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WSChooseTitleModel : NSObject

@property (nonatomic, copy)NSString *title;
@property (nonatomic, strong)UIColor *titleColor;

@end


@interface WSChooseCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong)WSChooseTitleModel *model;

@end

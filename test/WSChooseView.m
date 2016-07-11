//
//  WSChooseView.m
//  test
//
//  Created by ws on 16/7/11.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "WSChooseView.h"
#import "WSChooseCollectionViewCell.h"


#define leftRightMargin 0 //左右的间距
#define itemMargin 0      //item之间的间距
#define selectTextColor [UIColor whiteColor]  //选中时的字体颜色
#define lightTextColor [UIColor lightGrayColor]  //字体变浅时候的颜色

@interface WSChooseView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)NSMutableArray<WSChooseTitleModel *> * titleArr;

@property (nonatomic, weak)UICollectionView *collectionView;

@end


@implementation WSChooseView

- (instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray<NSString *> *)titleArr{
    
    if (self = [super initWithFrame:frame]) {
        self.canShowCount = 5;
        
        self.titleArr = [NSMutableArray array];
        for (NSString *title in titleArr) {
            WSChooseTitleModel *model = [[WSChooseTitleModel alloc] init];
            model.title = title;
            model.titleColor = [UIColor blackColor];
            [self.titleArr addObject:model];
        }
        self.backgroundColor = [UIColor whiteColor];
        [self setUpSubViews];
    }
    
    return self;
}

- (void)setUpSubViews{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    [self addSubview:collectionView];
    self.collectionView = collectionView;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[WSChooseCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor{
    
    self.collectionView.backgroundColor = backgroundColor;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    for (WSChooseTitleModel *m in self.titleArr) {
        m.titleColor = [UIColor blackColor];
    }
    
    self.titleArr[indexPath.row].titleColor = selectTextColor;
    if ((indexPath.row+1) < self.titleArr.count) {
        self.titleArr[indexPath.row + 1].titleColor = lightTextColor;
    }
    
    if ((indexPath.row+2) < self.titleArr.count) {
        self.titleArr[indexPath.row + 1].titleColor = lightTextColor;
        self.titleArr[indexPath.row + 2].titleColor = lightTextColor;
    }
    
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    if ([_delegate respondsToSelector:@selector(WSChooseView:DidChickItemAtIndex:)]) {
        [_delegate WSChooseView:self DidChickItemAtIndex:indexPath.row];
    }
    
    [collectionView reloadData]; 
}

- (void)selectItemAtIndex:(NSInteger)index{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    [self collectionView:self.collectionView didSelectItemAtIndexPath:indexPath];
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.titleArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    WSChooseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.model = self.titleArr[indexPath.row];
    
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat itemWidth = (collectionView.bounds.size.width - (self.canShowCount - 1) * itemMargin - 2 * leftRightMargin) / self.canShowCount;
    NSLog(@"%@---%f",NSStringFromCGRect(collectionView.bounds),itemWidth);
    return CGSizeMake(itemWidth, itemWidth);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, leftRightMargin, 0, leftRightMargin);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return itemMargin;
}

@end

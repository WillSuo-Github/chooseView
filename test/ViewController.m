//
//  ViewController.m
//  test
//
//  Created by ws on 16/7/11.
//  Copyright © 2016年 ws. All rights reserved.
//

#import "ViewController.h"
#import "WSChooseView.h"

@interface ViewController ()<WSChooseViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *titleArr = @[@"一月",@"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"十一月",@"十二月"];
    
    WSChooseView *chooseView = [[WSChooseView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 80) titleArr:titleArr];
//    chooseView.backgroundColor = [UIColor redColor];
    chooseView.backgroundColor = [UIColor whiteColor];
    chooseView.delegate = self;
    [self.view addSubview:chooseView];
}


- (void)WSChooseView:(WSChooseView *)chooseView DidChickItemAtIndex:(NSInteger)index{
    
    NSLog(@"点击了第%ld列",index);
}

@end

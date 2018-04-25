//
//  ViewController.m
//  WJCoreTextArcViewDemo
//
//  Created by Yuan Wang on 2018/4/25.
//  Copyright © 2018年 Yuan Wang. All rights reserved.
//

#import "ViewController.h"
#import "CostomView.h"
#import "CoreTextArcView.h"

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface ViewController ()

@property ( strong, nonatomic) NSMutableArray                      *mulArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CGFloat angle = M_PI/180;
    
    for (int i = 0; i < 5; i++) {
        
        NSString *string = [NSString stringWithFormat:@"->%d",i];
        
        UIView *arcBgView = [[UIView alloc] init];
        arcBgView.bounds = CGRectMake(0, 0, 300, 300);
        arcBgView.center = self.view.center;
        arcBgView.transform = CGAffineTransformMakeRotation(36*(angle+2*angle*i));
        arcBgView.backgroundColor = [UIColor clearColor];
        
        CoreTextArcView *arcViewTest = [self addCirWord:arcBgView.bounds text:string arcSize:15 color:[UIColor redColor]];
        [arcBgView addSubview:arcViewTest];
        [self.view addSubview:arcBgView];
        [self.mulArray addObject:arcBgView];
        
        
    }
    
}

- (CoreTextArcView *)addCirWord:(CGRect )rect text:(NSString *)words arcSize:(CGFloat)arcSize color:(UIColor *)color{
    
    CoreTextArcView *arcViewTest = [[CoreTextArcView alloc] initWithFrame:rect font:[UIFont systemFontOfSize:16] text:words radius:120 arcSize:arcSize color:color];
    arcViewTest.backgroundColor = [UIColor clearColor];
    
    return arcViewTest;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGFloat angle = M_PI/180;
    
    UIView *Cview = self.mulArray[2];
    
    UIView *bac = [[UIView alloc]init];
    bac.bounds = CGRectMake(0, 0, 300, 300);
    bac.center = self.view.center;
    bac.backgroundColor= [UIColor clearColor];
    bac.transform = CGAffineTransformMakeRotation(36*(angle+2*angle*2));
    
    
    CoreTextArcView *arcViewTest = [self addCirWord:Cview.bounds text:@"100" arcSize:15 color:[UIColor lightGrayColor
                                                                                               ]];
    
    
    [bac addSubview:arcViewTest];
    
    [self.mulArray replaceObjectAtIndex:2 withObject:bac];
    
    [Cview removeFromSuperview];
    [self.view addSubview:bac];
    
}


- (NSMutableArray *)mulArray{
    
    if (_mulArray== nil) {
        _mulArray = [NSMutableArray array];
    }
    return  _mulArray;
}


@end


//
//  CostomView.m
//  Demo
//
//  Created by Yuan Wang on 2018/4/23.
//  Copyright © 2018年 Yuan Wang. All rights reserved.
//

#import "CostomView.h"

@implementation CostomView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        
        
        self.label  = [[UILabel alloc]init];
        [self addSubview:self.label];
        
    }
    return  self;
}

- (void)setCom:(NSString *)string{
    
    self.label.frame = self.bounds;
    self.label.text = string;
    self.label.textColor = [UIColor blackColor];
}



@end

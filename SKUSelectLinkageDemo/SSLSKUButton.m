//
//  SSLSKUButton.m
//  SKUSelectLinkageDemo
//
//  Created by arbullzhang on 11/8/15.
//  Copyright © 2015 arbullzhang. All rights reserved.
//

#import "SSLSKUButton.h"

@implementation SSLSKUButton

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setImage:nil forState:UIControlStateNormal];
    [self setImage:nil forState:UIControlStateSelected];
}

- (void)radioBtnChecked {
    [self radioBtnCheckedCore];
}

- (void)setChecked:(BOOL)checked
{
    [super setChecked:checked];
    self.backgroundColor = [UIColor whiteColor];
}

@end

//
//  SSLSKUCell.m
//  SKUSelectLinkageDemo
//
//  Created by arbullzhang on 9/23/15.
//  Copyright © 2015 arbullzhang. All rights reserved.
//

#import "SSLSKUCell.h"

@interface SSLSKUCell ()

@property (nonatomic, retain) SSLSKUButton *skuButton;

@end

@implementation SSLSKUCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self setupControls];
    }
    return self;
}

- (void)setupControls
{
    self.skuButton = [[SSLSKUButton alloc] initWithFrame:self.bounds];
    self.skuButton.delegate = (id)self;
    self.skuButton.layer.borderWidth = 1 / [UIScreen mainScreen].scale;
    self.skuButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.skuButton.layer.cornerRadius = 4;
    self.skuButton.titleLabel.font = [UIFont systemFontOfSize:12];
    
    [self.skuButton setImage:nil forState:UIControlStateNormal];
    [self.skuButton setImage:nil forState:UIControlStateSelected];
    [self.skuButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.skuButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    
    [self addSubview:self.skuButton];
}

- (void)setGroupID:(NSString *)groupID
{
    [self.skuButton addToGroup:groupID];
}

- (void)updateTitle4Test:(NSString *)title
{
    [self.skuButton setTitle:title forState:UIControlStateNormal];
}

#pragma -mark QRadioButtonDelegate

- (void)didSelectedRadioButton:(QRadioButton *)radio groupId:(NSString *)groupId
{
    [self.skuButton setBackgroundColor:[UIColor orangeColor]];
    if(self.radioDelegate && [self.radioDelegate respondsToSelector:@selector(didSelectedRadioButton:groupId:)])
    {
        [self.radioDelegate didSelectedRadioButton:radio groupId:groupId];
    }
}

@end

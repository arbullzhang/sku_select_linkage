//
//  QViewController.m
//  QRadioButtonDemo
//
//  Created by ivan on 13-7-18.
//  Copyright (c) 2013年 ivan. All rights reserved.
//

#import "QViewController.h"

@interface QViewController ()

@end

@implementation QViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor whiteColor];
	// Do any additional setup after loading the view, typically from a nib.
    
    QRadioButton *_radio1 = [[QRadioButton alloc] initWithDelegate:self groupId:@"groupId1"];
    _radio1.frame = CGRectMake(20, 20, 80, 40);
    [_radio1 setTitle:@"苹果" forState:UIControlStateNormal];
    [_radio1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_radio1.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
    [self.view addSubview:_radio1];
    [_radio1 setChecked:YES];
    
    QRadioButton *_radio2 = [[QRadioButton alloc] initWithDelegate:self groupId:@"groupId1"];
    _radio2.frame = CGRectMake(20, 70, 80, 40);
    [_radio2 setTitle:@"梨子" forState:UIControlStateNormal];
    [_radio2 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_radio2.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
    [self.view addSubview:_radio2];
}

#pragma mark - QRadioButtonDelegate

- (void)didSelectedRadioButton:(QRadioButton *)radio groupId:(NSString *)groupId {
    NSLog(@"did selected radio:%@ groupId:%@", radio.titleLabel.text, groupId);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

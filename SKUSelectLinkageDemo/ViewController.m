//
//  ViewController.m
//  SKUSelectLinkageDemo
//
//  Created by arbullzhang on 11/25/15.
//  Copyright © 2015 arbullzhang. All rights reserved.
//

#import "ViewController.h"
#import "SSLSelectSKUView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:[[[NSBundle mainBundle] loadNibNamed:@"SSLSelectSKUView" owner:self options:nil] lastObject]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

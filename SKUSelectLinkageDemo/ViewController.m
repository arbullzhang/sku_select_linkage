//
//  ViewController.m
//  SKUSelectLinkageDemo
//
//  Created by zhuge.zzy on 11/25/15.
//  Copyright © 2015 arbullzhang. All rights reserved.
//

#import "ViewController.h"
#import "SSLSkuListModel.h"

@interface ViewController ()

@property (nonatomic, retain) SSLSkuListModel *skuListModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self mockNetWorkSkuListData];
    NSLog(@"");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mockNetWorkSkuListData
{
    // 颜色
    // 黄色    绿色    红色
    // 尺寸
    // 20     21      22    24
    // 款式
    // 单肩    双肩    斜挎
    
    self.skuListModel = [[SSLSkuListModel alloc] init];
    self.skuListModel.skuItemList = [[NSMutableArray alloc] init];
    
    [self createSkuItem:200 withQuantity:5 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"黄色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"20"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"单肩"}]];
    
    [self createSkuItem:201 withQuantity:67 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"黄色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"21"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"单肩"}]];
    
    [self createSkuItem:202 withQuantity:89 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"黄色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"22"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"单肩"}]];
    
    [self createSkuItem:203 withQuantity:88 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"黄色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"24"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"单肩"}]];
    
    [self createSkuItem:204 withQuantity:18 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"黄色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"20"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"双肩"}]];
    
    [self createSkuItem:205 withQuantity:36 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"黄色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"21"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"双肩"}]];
    
    [self createSkuItem:206 withQuantity:17 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"黄色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"22"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"双肩"}]];
    
    [self createSkuItem:207 withQuantity:98 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"黄色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"24"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"双肩"}]];
    
    [self createSkuItem:208 withQuantity:6 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"黄色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"20"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"斜挎"}]];
    
    [self createSkuItem:209 withQuantity:511 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"黄色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"21"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"斜挎"}]];
    
    [self createSkuItem:210 withQuantity:520 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"黄色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"22"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"斜挎"}]];
    
    [self createSkuItem:211 withQuantity:90 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"黄色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"24"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"斜挎"}]];
    
    [self createSkuItem:212 withQuantity:42 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"绿色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"20"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"单肩"}]];
    
    [self createSkuItem:213 withQuantity:15 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"黄色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"24"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"单肩"}]];
    
    [self createSkuItem:214 withQuantity:14 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"绿色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"20"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"双肩"}]];
    
    [self createSkuItem:215 withQuantity:13 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"绿色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"22"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"斜挎"}]];
    
    [self createSkuItem:216 withQuantity:6 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"绿色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"24"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"斜挎"}]];
    
    [self createSkuItem:217 withQuantity:1 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"红色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"20"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"双肩"}]];
    
    [self createSkuItem:218 withQuantity:11 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"红色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"21"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"双肩"}]];
    
    [self createSkuItem:219 withQuantity:20 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"红色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"22"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"双肩"}]];
    
    [self createSkuItem:220 withQuantity:50 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"红色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"20"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"斜挎"}]];
    
    [self createSkuItem:221 withQuantity:18 withPropertyArray:@[@{@"id":@"100", @"title":@"颜色", @"value":@"红色"},
                                                               @{@"id":@"101", @"title":@"尺寸", @"value":@"24"},
                                                               @{@"id":@"102", @"title":@"款式", @"value":@"斜挎"}]];
}

- (void)createSkuItem:(NSInteger)skuID
         withQuantity:(NSInteger)quantity
    withPropertyArray:(NSArray *)propertyArray
{
    SSLSkuItemModel *skuItemModel = [[SSLSkuItemModel alloc] init];
    skuItemModel.skuID = skuID;
    skuItemModel.quantity = quantity;
    skuItemModel.propertyList = [[NSMutableArray alloc] init];
    
    for(NSInteger index = 0; index < propertyArray.count; ++index)
    {
        NSDictionary *propertyDict = [propertyArray objectAtIndex:index];
        SSLSkuItemPropertyModel *skuItemPropertyModel = [[SSLSkuItemPropertyModel alloc] init];
        skuItemPropertyModel.propertyID = [[propertyDict valueForKey:@"id"] integerValue];
        skuItemPropertyModel.propertyTitle = [propertyDict valueForKey:@"title"];
        skuItemPropertyModel.propertyTitle = [propertyDict valueForKey:@"value"];
        
        [skuItemModel.propertyList addObject:skuItemPropertyModel];
    }
    
    [self.skuListModel.skuItemList addObject:skuItemModel];
}

@end

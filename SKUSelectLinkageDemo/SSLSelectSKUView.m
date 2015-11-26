//
//  SSLSelectSKUView.m
//  SKUSelectLinkageDemo
//
//  Created by arbullzhang on 9/21/15.
//  Copyright © 2015 arbullzhang. All rights reserved.
//

#import "SSLSelectSKUView.h"
#import "SSLSKUCell.h"
#import "QRadioButton.h"
#import "SSLSkuListModel.h"

@interface SSLSelectSKUView ()

@property (nonatomic, retain) SSLSkuListModel *skuListModel;

@property (nonatomic, retain) NSMutableDictionary *skuIdAndPropertysDict;
@property (nonatomic, retain) NSMutableDictionary *propertyCategoryDict;
@property (nonatomic, retain) NSMutableArray *propertyCategoryDictKeys;
@property (nonatomic, retain) NSMutableDictionary *mappingBetweenPropertyValueDict;

@end

@implementation SSLSelectSKUView

- (void)awakeFromNib
{
    [self mockNetWorkSkuListData];
    [self processSkuListData];
    
    [self.SKUCollectionView registerClass:[SSLSKUCell class] forCellWithReuseIdentifier:@"SKUCellIdentifier"];
    [self.SKUCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SSLSKUCollectionViewHeadSectionID"];
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout *)self.SKUCollectionView.collectionViewLayout;
    collectionViewLayout.headerReferenceSize = CGSizeMake([UIScreen mainScreen].bounds.size.width - 16 * 2, 40);
}

- (NSMutableDictionary *)skuIdAndPropertysDict
{
    if(!_skuIdAndPropertysDict)
    {
        _skuIdAndPropertysDict = [[NSMutableDictionary alloc] init];
    }
    return _skuIdAndPropertysDict;
}

- (NSMutableDictionary *)propertyCategoryDict
{
    if(!_propertyCategoryDict)
    {
        _propertyCategoryDict = [[NSMutableDictionary alloc] init];
    }
    return _propertyCategoryDict;
}

- (NSMutableArray *)propertyCategoryDictKeys
{
    if(!_propertyCategoryDictKeys)
    {
        _propertyCategoryDictKeys = [NSMutableArray arrayWithArray:[self.propertyCategoryDict allKeys]];
    }
    return _propertyCategoryDictKeys;
}

- (NSMutableDictionary *)mappingBetweenPropertyValueDict
{
    if(!_mappingBetweenPropertyValueDict)
    {
        _mappingBetweenPropertyValueDict = [[NSMutableDictionary alloc] init];
    }
    return _mappingBetweenPropertyValueDict;
}

- (void)processSkuListData
{
    // skuId对应出skuProperty集合
    for(SSLSkuItemModel *itemModel in self.skuListModel.skuItemList)
    {
        NSMutableSet *skuPropertySet = [[NSMutableSet alloc] init];
        for(SSLSkuItemPropertyModel *property in itemModel.propertyList)
        {
            // skuId和property之间的映射
            [skuPropertySet addObject:property.propertyValue];
            
            //property分类
            if([self.propertyCategoryDict objectForKey:property.propertyTitle])
            {
                NSMutableArray *propertyValueArray = [self.propertyCategoryDict valueForKey:property.propertyTitle];
                [propertyValueArray addObject:property.propertyValue];
                
                // propertyValueArray去重
                NSSet *temp = [NSSet setWithArray:propertyValueArray];
                [propertyValueArray removeAllObjects];
                [propertyValueArray addObjectsFromArray:[temp allObjects]];
            }
            else
            {
                NSMutableArray *propertyValueArray = [[NSMutableArray alloc] init];
                [propertyValueArray addObject:property.propertyValue];
                
                [self.propertyCategoryDict setObject:propertyValueArray forKey:property.propertyTitle];
            }
            
            //property value之间的映射
            for(SSLSkuItemPropertyModel *property2 in itemModel.propertyList)
            {
                if(property.propertyID != property2.propertyID)
                {
                    if([self.mappingBetweenPropertyValueDict valueForKey:property.propertyValue])
                    {
                        NSMutableDictionary *propertysDictExclusiveSelf = [self.mappingBetweenPropertyValueDict valueForKey:property.propertyValue];
                        if([propertysDictExclusiveSelf valueForKey:property2.propertyTitle])
                        {
                            NSMutableArray *propertyValuesArray = [propertysDictExclusiveSelf valueForKey:property2.propertyTitle];
                            [propertyValuesArray addObject:property2.propertyValue];
                            
                            //propertyValuesArray去重
                            NSSet *temp = [NSSet setWithArray:propertyValuesArray];
                            [propertyValuesArray removeAllObjects];
                            [propertyValuesArray addObjectsFromArray:[temp allObjects]];
                        }
                        else
                        {
                            NSMutableArray *propertyValuesArray = [[NSMutableArray alloc] init];
                            [propertyValuesArray addObject:property2.propertyValue];
                            
                            [propertysDictExclusiveSelf setObject:propertyValuesArray forKey:property2.propertyTitle];
                        }
                    }
                    else
                    {
                        NSMutableDictionary *propertysDictExclusiveSelf = [[NSMutableDictionary alloc] init];
                        NSMutableArray *propertyValuesArray = [[NSMutableArray alloc] init];
                        [propertyValuesArray addObject:property2.propertyValue];
                        [propertysDictExclusiveSelf setObject:propertyValuesArray forKey:property2.propertyTitle];
                        
                        [self.mappingBetweenPropertyValueDict setObject:propertysDictExclusiveSelf forKey:property.propertyValue];
                    }
                }
            }
        }
        
        // skuId和property之间的映射
        [self.skuIdAndPropertysDict setObject:skuPropertySet forKey:[NSString stringWithFormat:@"%ld", (long)itemModel.skuID]];
    }
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
        skuItemPropertyModel.propertyValue = [propertyDict valueForKey:@"value"];
        
        [skuItemModel.propertyList addObject:skuItemPropertyModel];
    }
    
    [self.skuListModel.skuItemList addObject:skuItemModel];
}

#pragma mark - UICollectionViewDelegate & UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [(NSMutableArray *)[self.propertyCategoryDict valueForKey:[self.propertyCategoryDictKeys objectAtIndex:section]] count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.propertyCategoryDict.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"SKUCellIdentifier";
    SSLSKUCell *cell = (SSLSKUCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.radioDelegate = (id)self;
    
    [cell setGroupID:[self.propertyCategoryDictKeys objectAtIndex:indexPath.section]];
    [cell updateTitle4Test:[(NSMutableArray *)[self.propertyCategoryDict valueForKey:[self.propertyCategoryDictKeys objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:@"SSLSKUCollectionViewHeadSectionID"
                                                                 forIndexPath:indexPath];
        
        [[reusableView viewWithTag:888888] removeFromSuperview];
        [[reusableView viewWithTag:999999] removeFromSuperview];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 16 * 2, 40)];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.text = [self.propertyCategoryDictKeys objectAtIndex:indexPath.section];
        if(indexPath.section != 0)
        {
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 16 * 2, 1 / [UIScreen mainScreen].scale)];
            line.backgroundColor = [UIColor lightGrayColor];
            line.tag = 999999;
            [reusableView addSubview:line];
        }
        
        titleLabel.tag = 888888;
        [reusableView addSubview:titleLabel];
    }
    return reusableView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(60, 24);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 10, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

#pragma mark - QRadioButtonDelegate

- (void)didSelectedRadioButton:(QRadioButton *)radio groupId:(NSString *)groupId
{
    //[self.SKUCollectionView reloadData];
}

@end

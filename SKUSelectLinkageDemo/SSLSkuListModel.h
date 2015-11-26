//
//  SSLSkuListModel.h
//  SKUSelectLinkageDemo
//
//  Created by arbullzhang on 11/25/15.
//  Copyright © 2015 arbullzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSLSkuItemPropertyModel : NSObject 

@property (nonatomic, assign) NSInteger propertyID;
@property (nonatomic, retain) NSString *propertyTitle;
@property (nonatomic, retain) NSString *propertyValue;

@end

@protocol SSLSkuItemPropertyModel <NSObject>
@end

////////////////////////////////////////////////////////////////////////////////////
///

@interface SSLSkuItemModel : NSObject

@property (nonatomic, assign) NSInteger skuID;
@property (nonatomic, assign) NSInteger quantity;
@property (nonatomic, retain) NSMutableArray/*<SSLSkuItemPropertyModel>*/ *propertyList;

@end

@protocol SSLSkuItemModel <NSObject>
@end

////////////////////////////////////////////////////////////////////////////////////
///

@interface SSLSkuListModel : NSObject

@property (nonatomic, retain) NSMutableArray/*<SSLSkuItemModel>*/ *skuItemList;

@end

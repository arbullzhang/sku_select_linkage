//
//  SSLSKUCell.h
//  SKUSelectLinkageDemo
//
//  Created by arbullzhang on 9/23/15.
//  Copyright © 2015 arbullzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSLSKUButton.h"

@interface SSLSKUCell : UICollectionViewCell

@property(nonatomic, assign) id<QRadioButtonDelegate> radioDelegate;

- (void)setGroupID:(NSString *)groupID;

- (void)updateTitle4Test:(NSString *)title;


@end

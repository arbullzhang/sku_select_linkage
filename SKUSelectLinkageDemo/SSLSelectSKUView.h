//
//  SSLSelectSKUView.h
//  SKUSelectLinkageDemo
//
//  Created by arbullzhang on 9/21/15.
//  Copyright © 2015 arbullzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSLSelectSKUView : UIView<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, retain) IBOutlet UICollectionView *SKUCollectionView;
@property (nonatomic, retain) IBOutlet UILabel *goodQuantityLabel;

@end

//
//  UIHomescreenView.h
//  Entelo
//
//  Created by Soheil Yasrebi on 10/9/13.
//  Copyright (c) 2013 Entelo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIHomescreenDataSource.h"
#import "UIHomescreenDelegate.h"

@interface UIHomescreenView : UIView

@property (nonatomic, assign) NSObject<UIHomescreenDataSource> *dataSource;
@property (nonatomic, assign) NSObject<UIHomescreenDelegate> *delegate;
@property (nonatomic, assign) NSUInteger rows;
@property (nonatomic, assign) NSUInteger columns;
@property (nonatomic, assign) float spacingRows;
@property (nonatomic, assign) float spacingColumns;

- (void)loadIconsForPage:(NSUInteger)page;
- (void)reloadData;

@end

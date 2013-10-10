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

- (void)loadIcons;

@end

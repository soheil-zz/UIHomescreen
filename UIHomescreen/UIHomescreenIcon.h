//
//  UIHomescreenIcon.h
//  Entelo
//
//  Created by Soheil Yasrebi on 10/9/13.
//  Copyright (c) 2013 Entelo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IndexPath3D.h"
#import "UIHomescreenDelegate.h"

@interface UIHomescreenIcon : UIView

@property (assign, nonatomic) NSString *imageURL;
@property (strong, nonatomic) UIImageView *icon;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) IndexPath3D *indexPath;
@property (nonatomic, assign) NSObject<UIHomescreenDelegate> *delegate;
@property (nonatomic, assign) UIHomescreenView *homescreenView;

- (id)initWithImageURL:(NSString *)imageURL;
- (id)initWithImage:(UIImage *)image;

@end

//
//  UIHomescreenIcon.m
//  Entelo
//
//  Created by Soheil Yasrebi on 10/9/13.
//  Copyright (c) 2013 Entelo. All rights reserved.
//

#import "UIHomescreenIcon.h"
#import "UIImageView+WebCache.h"

@implementation UIHomescreenIcon

- (id)initWithImageURL:(NSString *)imageURL
{
    self = [self init];
    self.imageURL = imageURL;
    
    //@TODO: fix placeholder -- user a generic image
    [self setImageWithURL:[NSURL URLWithString:imageURL]
                              placeholderImage:[UIImage imageNamed:kImagePlaceholder]];

    [self applyStyle];
    return self;
}

- (id)initWithImage:(UIImage *)image
{
    self = [super initWithImage:image];
    [self applyStyle];
    return self;
}

- (void)applyStyle
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 10.0;
//    self.layer.borderColor = [UIColor whiteColor].CGColor;
//    self.layer.borderWidth = 1.0f;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.layer.shouldRasterize = YES;
    self.clipsToBounds = YES;
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.frame;
    gradientLayer.colors = [NSArray arrayWithObjects:
                            (id)[[UIColor colorWithRed:0.988 green:0.988 blue:0.988 alpha:1.0] CGColor],
                            (id)[[UIColor colorWithRed:0.9294 green:0.9294 blue:0.949 alpha:1.0] CGColor],
                            nil];
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

@end

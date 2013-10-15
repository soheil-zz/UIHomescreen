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

- (id)init
{
    self = [self initWithFrame:CGRectMake(0, 0, 73, 90)];
    self.icon = [[UIImageView alloc] initWithFrame:CGRectMake(7, 0, 64, 64)];
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 67, 73, 10)];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self addGestureRecognizer:tapGesture];

    [self addSubview:self.icon];
    [self addSubview:self.label];
    
    return self;
}

- (id)initWithImageURL:(NSString *)imageURL
{
    self = [self init];
    self.imageURL = imageURL;
    
    //@TODO: fix placeholder -- user a generic image
    [self.icon setImageWithURL:[NSURL URLWithString:imageURL]
         placeholderImage:[UIImage imageNamed:@"placeholder.png"]
                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {

                }];
    [self applyStyle];
    
    return self;
}

- (id)initWithImage:(UIImage *)image
{
    self = [self init];
    self.icon = [self.icon initWithImage:image];
    [self applyStyle];
    
    return self;
}

- (void)tap
{
    [UIView animateWithDuration:0.1
                     animations:^{
                         self.icon.alpha = .6;
                     }
                     completion:^(BOOL finished) {
                         self.icon.alpha = 1;
                         [self.delegate homescreenView:self.homescreenView didSelectRowAtIndexPath3D:self.indexPath];
                     }];
}

- (void)applyStyle
{
    self.icon.layer.masksToBounds = YES;
    self.icon.layer.cornerRadius = 10.0;
    self.icon.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.icon.layer.shouldRasterize = YES;
    self.icon.clipsToBounds = YES;
    
    self.label.textColor = [UIColor whiteColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.label setFont:[UIFont systemFontOfSize:12]];
}

@end

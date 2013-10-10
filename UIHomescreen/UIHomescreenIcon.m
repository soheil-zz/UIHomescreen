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
    self.imageURL = imageURL;
    
    //@TODO: fix placeholder -- user a generic image
    [self setImageWithURL:[NSURL URLWithString:imageURL]
                              placeholderImage:[UIImage imageNamed:kImagePlaceholder]];
    return self;
}

@end

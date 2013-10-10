//
//  UIHomescreenView.m
//  Entelo
//
//  Created by Soheil Yasrebi on 10/9/13.
//  Copyright (c) 2013 Entelo. All rights reserved.
//

#import "UIHomescreenView.h"
#import "UIHomescreenIcon.h"

@implementation UIHomescreenView

- (id)init
{
    self = [super init];
    self.backgroundColor = [UIColor grayColor];
    for (int i = 0; i < 3; i++){
        UIHomescreenIcon *icon = [[UIHomescreenIcon alloc] initWithImage:[UIImage imageNamed:@"entelo.png"]];
        CGRect frame = icon.frame;
        frame.origin.x = i*50;
        icon.frame = frame;
        [self addSubview:icon];
    }
    return self;
}

@end

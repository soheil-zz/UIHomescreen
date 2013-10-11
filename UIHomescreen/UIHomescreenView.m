//
//  UIHomescreenView.m
//  Entelo
//
//  Created by Soheil Yasrebi on 10/9/13.
//  Copyright (c) 2013 Entelo. All rights reserved.
//

#import "UIHomescreenView.h"
#import "UIHomescreenIcon.h"
#import "IndexPath3D.h"

@implementation UIHomescreenView

@synthesize dataSource;

- (id)init
{
    self = [super init];
    self.backgroundColor = [UIColor grayColor];
    return self;
}

- (void)loadIcons
{
    for (int i = 0; i < 5; i++){
        for (int j = 0; j < 4; j++){
            IndexPath3D *indexPath = [[IndexPath3D alloc] initWithPage:0 withRow:i withColumn:j];
            NSLog(@"calling datasource");
            UIHomescreenIcon *icon = [self.dataSource homescreenView:self iconForPositionAtIndexPath3D:indexPath];
            icon.delegate = self.delegate;
            icon.indexPath = indexPath;
            icon.homescreenView = self;
            CGRect frame = icon.frame;
            frame.origin.x = 10 + j * 75;
            frame.origin.y = 10 + i * 92;
            icon.frame = frame;
            [self addSubview:icon];
        }
    }
}

@end

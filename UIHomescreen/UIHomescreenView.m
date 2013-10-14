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
{
    NSUInteger _page;
}

@synthesize dataSource;

- (id)init
{
    self = [super init];
    self.backgroundColor = [UIColor grayColor];
    return self;
}

- (void)loadIconsForPage:(NSUInteger)page
{
    _page = page;
    for (int i = 0; i < self.rows; i++) {
        for (int j = 0; j < self.columns; j++) {
            IndexPath3D *indexPath = [[IndexPath3D alloc] initWithPage:page withRow:i withColumn:j];
            UIHomescreenIcon *icon = [self.dataSource homescreenView:self iconForPositionAtIndexPath3D:indexPath];
            icon.delegate = self.delegate;
            icon.indexPath = indexPath;
            icon.homescreenView = self;
            CGRect frame = icon.frame;
            frame.origin.x = 10 + j * self.spacingColumns;
            frame.origin.y = 10 + i * self.spacingRows;
            icon.frame = frame;
            [self addSubview:icon];
        }
    }
}

- (void)reloadData
{
    [self loadIconsForPage:_page];
}

@end

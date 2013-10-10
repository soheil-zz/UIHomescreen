//
//  UIHomescreenDataSource.h
//  Entelo
//
//  Created by Soheil Yasrebi on 10/9/13.
//  Copyright (c) 2013 Entelo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIHomescreenDataSource;
@class UIHomescreenView, UIHomescreenIcon, IndexPath3D;

@protocol UIHomescreenDataSource <NSObject>

@required

- (UIHomescreenIcon *)homescreenView:(UIHomescreenView *)homescreenView iconForPositionAtIndexPath3D:(IndexPath3D *)indexPath;

@end

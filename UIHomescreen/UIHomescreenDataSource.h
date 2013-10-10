//
//  UIHomescreenDataSource.h
//  Entelo
//
//  Created by Soheil Yasrebi on 10/9/13.
//  Copyright (c) 2013 Entelo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIHomescreenIcon.h"
#import "UIHomescreenView.h"
#import "IndexPath3D.h"

@protocol UIHomescreenDataSource <NSObject>

@required

- (UIHomescreenIcon *)homescreenView:(UIView *)homescreenView iconForPositionAtIndexPath3D:(IndexPath3D *)indexPath;

@end

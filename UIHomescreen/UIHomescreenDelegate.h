//
//  UIHomescreenDelegate.h
//  Entelo
//
//  Created by Soheil Yasrebi on 10/9/13.
//  Copyright (c) 2013 Entelo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIHomescreenDelegate;
@class UIHomescreenView, IndexPath3D;

@protocol UIHomescreenDelegate <NSObject>
@required

- (void)homescreenView:(UIHomescreenView *)homescreenView didSelectRowAtIndexPath3D:(IndexPath3D *)indexPath;

@end

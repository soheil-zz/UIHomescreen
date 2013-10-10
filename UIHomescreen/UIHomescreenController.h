//
//  UIHomescreenController.h
//  UIHomescreen
//
//  Created by Soheil Yasrebi on 10/9/13.
//
//

#import <UIKit/UIKit.h>
#import "UIHomescreenDataSource.h"
#import "UIHomescreenDelegate.h"

@interface UIHomescreenController : UIPageViewController <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

- (UIHomescreenController *)init;

@property (nonatomic, assign) NSObject<UIHomescreenDataSource> *viewDataSource;
@property (nonatomic, assign) NSObject<UIHomescreenDelegate> *viewDelegate;

@end

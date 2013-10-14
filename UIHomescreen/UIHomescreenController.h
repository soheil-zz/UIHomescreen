//
//  UIHomescreenController.h
//  UIHomescreen
//
//  Created by Soheil Yasrebi on 10/9/13.
//
//

#import <UIKit/UIKit.h>
#import "UIHomescreenView.h"
#import "UIHomescreenIcon.h"
#import "IndexPath3D.h"
#import "UIHomescreenDataSource.h"
#import "UIHomescreenDelegate.h"

@interface UIHomescreenController : UIPageViewController <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

- (UIHomescreenController *)initWithTotalIconCount:(NSUInteger)totalIconCount;
- (void)moveToViewControllerAtIndex:(NSUInteger)index;

@property (nonatomic, assign) NSObject<UIHomescreenDataSource> *viewDataSource;
@property (nonatomic, assign) NSObject<UIHomescreenDelegate> *viewDelegate;
@property (nonatomic, assign) NSUInteger totalIconCount;
@property (nonatomic, assign) NSUInteger rows;
@property (nonatomic, assign) NSUInteger columns;
@property (nonatomic, assign) float spacingRows;
@property (nonatomic, assign) float spacingColumns;
@property (nonatomic, strong) UIHomescreenView *homescreenView;

@end

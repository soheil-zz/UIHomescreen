//
//  UIHomescreenController.m
//  UIHomescreen
//
//  Created by Soheil Yasrebi on 10/9/13.
//
//

#import "UIHomescreenController.h"
#import "UIHomescreenView.h"

@interface UIHomescreenController ()
{
    NSInteger selectedIndex, pageCount;
}
@end

@implementation UIHomescreenController

- (UIHomescreenController *)initWithTotalIconCount:(NSUInteger)totalIconCount
{
    self = [self initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                   navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                 options:nil];
    self.delegate = self;
    self.dataSource = self;
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    self.rows = screenSize.height > 480 ? 5 : 4;
    self.columns = 4;
    self.spacingRows = 92;
    self.spacingColumns = 75;
    self.totalIconCount = totalIconCount;
    self.view.backgroundColor = [UIColor grayColor];
    
    [self setViewControllers:[NSArray arrayWithObject:[self viewControllerAtIndex:0]]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:YES
                  completion:nil];
    
    return self;
}

- (void)moveToViewControllerAtIndex:(NSUInteger)index
{
    NSLog(@"moveToViewControllerAtIndex: %d selected index: %d", (int)index, (int)selectedIndex);
    // already there no need to move
    if (selectedIndex == index) return;

    [self setViewControllers:[NSArray arrayWithObject:[self viewControllerAtIndex:index]]
                   direction:(index > selectedIndex ? UIPageViewControllerNavigationDirectionForward : UIPageViewControllerNavigationDirectionReverse)
                    animated:YES
                  completion:nil];
    selectedIndex = index;
}

- (void)viewWillAppear:(BOOL)animated
{
    UIPageControl *pageControl = [UIPageControl appearance];
    if (self.pageControlHidden) {
        pageControl.pageIndicatorTintColor = self.homescreenView.backgroundColor;
        pageControl.currentPageIndicatorTintColor = self.homescreenView.backgroundColor;
        pageControl.backgroundColor = self.homescreenView.backgroundColor;
    } else {
        pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        pageControl.backgroundColor = [UIColor grayColor];
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSLog(@"viewControllerBeforeViewController %d", (int)selectedIndex);
    if (selectedIndex == 0) {
        return nil;
    }
    return [self viewControllerAtIndex:--selectedIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSLog(@"viewControllerAfterViewController %d", (int)selectedIndex);
    return [self viewControllerAtIndex:++selectedIndex];
}

- (UIViewController *)viewControllerAtIndex:(NSInteger)index
{
    NSLog(@"viewControllerAtIndex %d", (int)index);
    UIViewController *viewController = [[UIViewController alloc] init];
    _homescreenView = [[UIHomescreenView alloc] init];

    //@TODO: make homescreenView properties private and pass them through init
    _homescreenView.rows = self.rows;
    _homescreenView.columns = self.columns;
    _homescreenView.spacingRows = self.spacingRows;
    _homescreenView.spacingColumns = self.spacingColumns;
    _homescreenView.backgroundColor = self.view.backgroundColor;
    
    _homescreenView.delegate = self.viewDelegate;
    _homescreenView.dataSource = self.viewDataSource;
    [_homescreenView loadIconsForPage:index];
    viewController.view = _homescreenView;
    
    return viewController;
}

- (void)setTotalIconCount:(NSUInteger)totalIconCount
{
    NSUInteger perPage = self.rows * self.columns;
    pageCount = (totalIconCount + perPage - 1) / perPage;
    _totalIconCount = totalIconCount;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    // The selected item reflected in the page indicator.
    return 0;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    // The number of items reflected in the page indicator.
    return pageCount;
}

@end

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
    self.view.backgroundColor = [UIColor whiteColor];
    self.delegate = self;
    self.dataSource = self;
    
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    self.rows = screenSize.height > 480 ? 5 : 4;
    self.columns = 4;
    self.spacingRows = 92;
    self.spacingColumns = 75;
    self.totalIconCount = totalIconCount;

    UIPageControl *pageControl = [UIPageControl appearance];
    //@TODO: nice to have: have a central place for colors + view
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.backgroundColor = [UIColor grayColor];
    
    
    [self setViewControllers:[NSArray arrayWithObject:[self viewControllerAtIndex:0]]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:YES
                  completion:nil];
    
    return self;
}

- (void)moveToViewControllerAtIndex:(NSUInteger)index
{
    // already there no need to move
    if (selectedIndex == index) return;

    [self setViewControllers:[NSArray arrayWithObject:[self viewControllerAtIndex:index]]
                   direction:selectedIndex > index
     ? UIPageViewControllerNavigationDirectionReverse : UIPageViewControllerNavigationDirectionForward
                    animated:YES
                  completion:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    //@TODO: nice to have: have a central place for colors + view - same as above
    UIPageControl *pageControl = [UIPageControl appearance];
    if (pageCount > 10) {
        pageControl.pageIndicatorTintColor = [UIColor grayColor];
        pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
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
    
    _homescreenView.delegate = self.viewDelegate;
    _homescreenView.dataSource = self.viewDataSource;
    //@TODO:
    // if datasource has data for page: index
    [_homescreenView loadIconsForPage:index];
    // else show loading hud and wait and move to next page automatically once page is loaded
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

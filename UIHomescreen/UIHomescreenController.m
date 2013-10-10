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
    NSInteger selectedIndex;
}
@end

@implementation UIHomescreenController

- (UIHomescreenController *)init
{
    self = [self initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                   navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                 options:nil];
    self.view.backgroundColor = [UIColor whiteColor];
    self.delegate = self;
    self.dataSource = self;
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self setViewControllers:[NSArray arrayWithObject:[self viewControllerAtIndex:0]]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO
                  completion:nil];
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
    UIHomescreenView *homescreenView = [[UIHomescreenView alloc] init];
    homescreenView.delegate = self.viewDelegate;
    homescreenView.dataSource = self.viewDataSource;
    [homescreenView loadIcons];
    viewController.view = homescreenView;
    
    //@TODO: frame should auto size
    CGRect bounds = viewController.view.bounds;
    bounds.origin.y = -65;
    viewController.view.bounds = bounds;
    
    return viewController;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    // The selected item reflected in the page indicator.
    NSLog(@"presentationIndexForPageViewController");
    return 0;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    // The number of items reflected in the page indicator.
    NSLog(@"presentationCountForPageViewController");
    return 3;
}

@end

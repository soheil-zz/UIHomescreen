//
//  UIHomescreenIcon.h
//  Entelo
//
//  Created by Soheil Yasrebi on 10/9/13.
//  Copyright (c) 2013 Entelo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIHomescreenIcon : UIImageView

@property (assign, nonatomic) NSString *imageURL;

- (id)initWithImageURL:(NSString *)imageURL;

@end

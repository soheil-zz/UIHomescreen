//
//  IndexPath3D.h
//  Entelo
//
//  Created by Soheil Yasrebi on 10/9/13.
//  Copyright (c) 2013 Entelo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IndexPath3D : NSObject

@property (readwrite, nonatomic) int page;
@property (readwrite, nonatomic) int row;
@property (readwrite, nonatomic) int column;

- (IndexPath3D *)initWithPage:(NSUInteger)page withRow:(NSUInteger)row withColumn:(NSUInteger)column;

@end

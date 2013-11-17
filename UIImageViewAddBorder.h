//
//  UIImageViewAddBorder.h
//  ImageBorder
//
//  Created by Nikolaos Maounis on 7/7/13.
//  Copyright (c) 2013 Nikolaos Maounis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImageView (ImageViewBorder)

-(void)setImage:(UIImage*)image borderWidth:(CGFloat)borderWidth setRoundedCorners:(BOOL)setRoundedCorners;

@end
//
//  UIImageViewAddBorder.m
//  ImageBorder
//
//  Created by Nikolaos Maounis on 7/7/13.
//  Copyright (c) 2013 Nikolaos Maounis. All rights reserved.
//

#import "UIImageViewAddBorder.h"
#import "QuartzCore/QuartzCore.h"

@interface UIImageView (private)

-(UIImage*)scaleDownImage:(UIImage*)image;

-(void)setImage:(UIImage*)image withBorderWidth:(CGFloat)borderWidth;


@end

@implementation UIImageView (ImageViewBorder)

-(UIImage*)scaleDownImage:(UIImage*)image{
    UIImage* scaledDownImage = image;
    
    CALayer* layer = self.layer;
    CGFloat borderWidth = layer.borderWidth;
    
    if (borderWidth > 0)
    {
        CGRect newRect = CGRectMake(0.0, 0.0, self.bounds.size.width - 2 * borderWidth, self.bounds.size.height - 2 *borderWidth);
        
        if (image.size.height > newRect.size.height || image.size.width > newRect.size.width)
        {
            UIGraphicsBeginImageContext(newRect.size);
            [image drawInRect:newRect];
            scaledDownImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }
    }
    return scaledDownImage;
}

-(void)addImageViewBorder:(CGFloat)borderWidth
{
    CALayer* layer = [self layer];
    [layer setBackgroundColor:[UIColor grayColor].CGColor];
    [layer setBorderWidth:borderWidth];
    [self setContentMode:UIViewContentModeCenter];
    self.clipsToBounds = YES;
    [layer setBorderColor:[UIColor whiteColor].CGColor];
    [layer setShadowColor:[UIColor blackColor].CGColor];
    layer.shadowOpacity = 0.6;
    layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    layer.shadowRadius = 5.0f;
    
}

-(BOOL)isCircle:(BOOL)isCircle {
    if (isCircle){
        return YES;
    } else {
        return NO;
    }
}


-(void)setImage:(UIImage*)image borderWidth:(CGFloat)borderWidth setRoundedCorners:(BOOL)setRoundedCorners
{
    [self addImageViewBorder:borderWidth];
    UIImage* scaledDownImage = [self scaleDownImage:image];
    self.image = scaledDownImage;
    if (setRoundedCorners){
    self.layer.cornerRadius = self.image.size.width / 8;
    self.layer.masksToBounds = YES;
    }
}

@end
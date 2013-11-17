//
//  ViewController.m
//  ImageBorder
//
//  Created by Nikolaos Maounis on 7/7/13.
//  Copyright (c) 2013 Nikolaos Maounis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize myImageView, addBorderBtn;

BOOL borderApplied = NO;

- (void)viewDidLoad
{
    UIImage* myImage = [UIImage imageNamed:@"photo.jpg"];
    self.myImageView.autoresizingMask =  UIViewAutoresizingNone;
    self.myImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.myImageView.clipsToBounds = YES;
    [self.myImageView setImage:myImage borderWidth:0.0f setRoundedCorners:NO];
   
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)addBorder:(id)sender {
    
    if (!borderApplied){
        borderApplied = YES;
        UIImage* myImage = [UIImage imageNamed:@"photo.jpg"];
        [self.myImageView setImage:myImage borderWidth:3.0 setRoundedCorners:YES];
    } else {
        borderApplied = NO;
        UIImage* myImage = [UIImage imageNamed:@"photo.jpg"];
        self.myImageView.autoresizingMask =  UIViewAutoresizingNone;
        self.myImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.myImageView.clipsToBounds = YES;
        [self.myImageView setImage:myImage borderWidth:0.0f setRoundedCorners:NO];

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

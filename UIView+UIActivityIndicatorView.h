//
//  UIView+LoadingIndicator.h
//  Test
//
//  Created by Andrey Finayev on 10/26/13.
//  Copyright (c) 2013 Andrey Finayev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIActivityIndicatorView)

@property (strong,nonatomic) UIActivityIndicatorView *activityIndicatorView;

-(void)startLoading;
-(void)startLoadingWithStyle:(UIActivityIndicatorViewStyle)style;
-(void)stopLoading;

@end

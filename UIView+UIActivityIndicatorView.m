//
//  UIView+UIActivityIndicatorView.m
//  Test
//
//  Created by Andrey Finayev on 10/26/13.
//  Copyright (c) 2013 Andrey Finayev. All rights reserved.
//

#import "UIView+UIActivityIndicatorView.h"
#import <objc/runtime.h>

static char const * const kActivityIndicatorAttachmentKey = "kActivityIndicatorAttachment";

@implementation UIView (UIActivityIndicatorView)

@dynamic activityIndicatorView;

- (void)setActivityIndicatorView:(UIActivityIndicatorView *)activityIndicatorView
{
	objc_setAssociatedObject(self, kActivityIndicatorAttachmentKey, activityIndicatorView, OBJC_ASSOCIATION_RETAIN);
}

- (UIActivityIndicatorView*)activityIndicatorView
{
	return objc_getAssociatedObject(self, kActivityIndicatorAttachmentKey);
}

-(void)startLoadingWithStyle:(UIActivityIndicatorViewStyle)style{
    if(self.activityIndicatorView==nil){
        self.activityIndicatorView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
        self.activityIndicatorView.hidesWhenStopped=YES;
    }
    self.activityIndicatorView.frame=self.frame;
    [self.superview insertSubview:self.activityIndicatorView aboveSubview:self];
    self.activityIndicatorView.hidden=NO;
    [self.activityIndicatorView startAnimating];
    self.hidden=YES;
}

-(void)startLoading{
    [self startLoadingWithStyle:UIActivityIndicatorViewStyleGray];
}

-(void)stopLoading{
    self.activityIndicatorView.hidden=YES;
    [self.activityIndicatorView removeFromSuperview];
    self.hidden=NO;
}

@end

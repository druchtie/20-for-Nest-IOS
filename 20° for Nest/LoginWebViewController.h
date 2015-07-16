//
//  LoginWebViewController.h
//  20° for Nest
//
//  Created by Karsten Westra on 16/07/15.
//  Copyright (c) 2015 20°. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginWebViewController : UIViewController <UIWebViewDelegate>

- (void)loadURL:(NSURL*)url;

@end

//
//  LoginWebViewController.m
//  20° for Nest
//
//  Created by Karsten Westra on 16/07/15.
//  Copyright (c) 2015 20°. All rights reserved.
//

#import "LoginWebViewController.h"
#import "NSURL+QueryParser.h"

@interface LoginWebViewController ()

@end

#define QUESTION_MARK @"?"
#define SLASH @"/"
#define HASHTAG @"#"
#define EQUALS @"="
#define AMPERSAND @"&"
#define EMPTY_STRING @""

@implementation LoginWebViewController

- (void)loadView {
    self.view = [[UIWebView alloc] init];

    CGRect bounds = [[UIScreen mainScreen] bounds];
    
    self.view = [[UIWebView alloc] init];
    self.view.autoresizesSubviews = YES;
    self.view.frame = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self webView] setDelegate:self];
}

- (void)viewDidUnload {
    [[self webView] setDelegate:nil];
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Actions
- (void)loadURL:(NSURL*)url {
    NSLog(@"Loading page named: '%@'", [url absoluteString]);
    [[self webView] loadRequest:[NSURLRequest requestWithURL:url]];
}

#pragma mark - 
#pragma mark Webview Get&Set
- (UIWebView*)webView {
    return (UIWebView*)self.view;
}
#pragma mark -
#pragma UIWebView Delegate
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"[UIWebViewController] Load failed: %@", error);
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

/**
 * Intercept the requests to get the authorization code.
 */
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSURL *url = [request URL];
    
    NSLog(@"%s: url = %@", __PRETTY_FUNCTION__, url);
    
    NSURL *redirectURL = [[NSURL alloc] initWithString:@"https://www.20degrees.nl/auth"];
    
    if ([[url host] isEqualToString:[redirectURL host]]) {
        
        
        NSDictionary *queryDict = [url queryDictionary];
        NSLog(@"URL query: %@", queryDict);
        
       
        return NO;
    }
    
    return YES;
}


@end

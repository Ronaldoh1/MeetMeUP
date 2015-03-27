//
//  WebViewController.m
//  MeetMeUp
//
//  Created by Ronald Hernandez on 3/24/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIButton *goForwardButton;

@property (weak, nonatomic) IBOutlet UIButton *goBackButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.activityIndicator.hidesWhenStopped = true;
    [self performLoadRequestWithString:@"http://www.google.com"];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:true];
}

#pragma mark - UIWebDelegate Protocols

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [self.activityIndicator startAnimating];

    
}
-(void) performLoadRequestWithString:(NSString *) string{
    NSURL *url = [NSURL URLWithString:string];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [self.webView loadRequest:request];
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Failed to load webpage" message:error.localizedDescription delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Try Again", nil];
    [alertView show];

}

//--when the web finishes loading--//
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.activityIndicator stopAnimating];

    if(webView.canGoBack){
        self.goBackButton.alpha = 1.0;
        self.goBackButton.enabled = true;
    }else{
        self.goBackButton.alpha = 0.0;
        self.goBackButton.enabled = true;
    }

    if(webView.canGoForward){
        self.goForwardButton.alpha = 1.0;
        self.goForwardButton.enabled = true;
    }else{
        self.goForwardButton.alpha = 0.0;
        self.goBackButton.enabled = true;

    }


}


@end

//
//  HelpDetailView.m
//  Assignment
//
//  Created by DK on 12/3/13.
//  Copyright (c) 2013 DK. All rights reserved.
//

#import "HelpDetailView.h"

@interface HelpDetailView ()

@end

@implementation HelpDetailView
@synthesize webView,sName;

@synthesize backBtn,forwardBtn, goBtn, dummyBtn, addrTxt;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    flag = NO;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    addrTxt.delegate = self;
    webView.delegate = self;
    webView.scrollView.delegate = self;

    addrTxt.text = sName;

    [self goURL:self];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [addrTxt resignFirstResponder];
    [self goURL:self];
   
    return YES;
}

-(IBAction)goURL:(id)sender
{
    [addrTxt resignFirstResponder];

    NSURLRequest *request;
    request = [NSURLRequest requestWithURL:[NSURL URLWithString:addrTxt.text]];
    
    [webView loadRequest:request];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.webView setHidden:YES];
    [addrTxt resignFirstResponder];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.webView setHidden:NO];
    
    [backBtn setEnabled:[self.webView canGoBack]];
    [forwardBtn setEnabled:[self.webView canGoForward]];
    
    addrTxt.text = sName = self.webView.request.URL.absoluteString;
}

-(IBAction)pressBack:(id)sender
{
    [webView goBack];
}

-(IBAction)pressForward:(id)sender
{
    [webView goForward];
}

-(IBAction)keyResign:(id)sender
{
    [addrTxt resignFirstResponder];
}

- (void)scrollViewWillBeginDragging:(UIWebView *)webView
{
    [addrTxt resignFirstResponder];
    
    [timer invalidate];
    flag = YES;
    [self showAndHide:timer];
}

- (void)scrollViewDidEndDragging:(UIWebView *)webView willDecelerate:(BOOL)decelerate
{
    [timer invalidate];
    flag = NO;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(showAndHide:) userInfo:nil repeats:NO];
}

-(void)showAndHide:(NSTimer *)timer
{
    [dummyBtn setHidden:flag];
    [backBtn setHidden:flag];
    [forwardBtn setHidden:flag];
    [goBtn setHidden:flag];
    [addrTxt setHidden:flag];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

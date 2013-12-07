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

//@synthesize  description;
@synthesize backBtn,forwardBtn, goBtn, addrTxt;

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
}

-(void) viewWillAppear:(BOOL)animated
{
    //NSLog(@"%@ , %@", description.text, addrTxt.text);
    
    [super viewWillAppear:YES];
    addrTxt.delegate = self;
    webView.delegate = self;

    addrTxt.text = sName;
    [self goURL:self];
    
    /*NSURLRequest *request;
    request = [NSURLRequest requestWithURL:[NSURL URLWithString:sName]];
    addrTxt.text = sName;
    
    webView.delegate = self;
    [webView loadRequest:request];*/
    NSLog(@"%f",[webView pageLength]);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [addrTxt resignFirstResponder];
    
    NSLog(@"event");
    [self goURL:self];
    
    return YES;
}

-(IBAction)goURL:(id)sender
{
    [addrTxt resignFirstResponder];
    
    //[addrTxt.text initWithFormat:@"http://%@" arguments:addrTxt.text];
    
    NSLog(@"event");
    NSURLRequest *request;
    request = [NSURLRequest requestWithURL:[NSURL URLWithString:addrTxt.text]];
    //addrTxt.text = description.text;
    NSLog(@"%@",  addrTxt.text);
    
    [webView loadRequest:request];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [webView setHidden:YES];
    [addrTxt resignFirstResponder];
     
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [webView setHidden:NO];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

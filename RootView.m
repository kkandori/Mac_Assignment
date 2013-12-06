//
//  RootView.m
//  Assignment
//
//  Created by DK on 12/3/13.
//  Copyright (c) 2013 DK. All rights reserved.
//

#import "RootView.h"

@interface RootView ()

@end

@implementation RootView
@synthesize timerView, helpView, aboutView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Move to Timer View
-(IBAction)moveToTimerView:(id)sender
{
    if(timerView==nil)
    {
        timerView = [[TimerView alloc]initWithNibName:@"TimerView" bundle:nil];
    }
    
    timerView.title = @"커피 타이머";
    
    [self.navigationController pushViewController:timerView animated:YES];

}

// Move to Help View
-(IBAction)moveToHelpView:(id)sender
{
    if(helpView==nil)
    {
        helpView = [[HelpView alloc]initWithNibName:@"HelpView" bundle:nil];
    }
    
    helpView.title = @"길라잡이";
    
    [self.navigationController pushViewController:helpView animated:YES];
}

// Move to About View
-(IBAction)moveToAboutView:(id)sender
{
    if(aboutView==nil)
    {
        aboutView = [[AboutView alloc]initWithNibName:@"AboutView" bundle:nil];
    }
    
    aboutView.title = @"이것은...";
    
    [self.navigationController pushViewController:aboutView animated:YES];
}

@end

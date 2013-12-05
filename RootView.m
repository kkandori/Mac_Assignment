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
//@synthesize imgViewBG;

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
    //NSString *imgBGPath = [[NSBundle mainBundle]pathForResource:@"barista_main2" ofType:@"png"];
    //NSString *imgBGPath = [[NSBundle mainBundle]pathForResource:@"barista_main1_2" ofType:@"png"];
    
    //imgBG = [[UIImage alloc] initWithContentsOfFile:imgBGPath];
    //imgViewBG.image = imgBG;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)moveToTimerView:(id)sender
{
    if(timerView==nil)
    {
        timerView = [[TimerView alloc]initWithNibName:@"TimerView" bundle:nil];
    }
    
    timerView.title = @"Coffee Timer";
    
    [self.navigationController pushViewController:timerView animated:YES];

}
-(IBAction)moveToHelpView:(id)sender
{
    if(helpView==nil)
    {
        helpView = [[HelpView alloc]initWithNibName:@"HelpView" bundle:nil];
    }
    
    helpView.title = @"Help";
    
    [self.navigationController pushViewController:helpView animated:YES];
}
-(IBAction)moveToAboutView:(id)sender
{
    if(aboutView==nil)
    {
        aboutView = [[AboutView alloc]initWithNibName:@"AboutView" bundle:nil];
    }
    
    aboutView.title = @"About";
    
    [self.navigationController pushViewController:aboutView animated:YES];
}

@end

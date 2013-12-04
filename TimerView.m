//
//  TimerView.m
//  Assignment
//
//  Created by DK on 12/3/13.
//  Copyright (c) 2013 DK. All rights reserved.
//

#import "TimerView.h"

@interface TimerView ()

@end

@implementation TimerView
@synthesize imgViewDrip, imgViewMin, imgViewCol, imgViewSec01, imgViewSec02;
@synthesize msgView;
@synthesize steps, keys;

//@synthesize imgDrip, imgNumber[10], imgNum;

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
    NSString *imgDripPath = [[NSBundle mainBundle]pathForResource:@"handdrip" ofType:@"png"];
    NSString *imgColPath = [[NSBundle mainBundle]pathForResource:@"colone" ofType:@"png"];
    NSString *imgNumPath[10];
    NSString *descPath = [[NSBundle mainBundle]pathForResource:@"DripText" ofType:@"plist"];
    
    // Loading images
    for (int i=0; i<10; i++) {
        NSString *tmp = [[NSString alloc]initWithFormat:@"%i", i ];
        imgNumPath[i] = [[NSBundle mainBundle]pathForResource:tmp ofType:@"png"];
        imgNumber[i] = [[UIImage alloc] initWithContentsOfFile:imgNumPath[i]];
    }
    
    imgDrip = [[UIImage alloc] initWithContentsOfFile:imgDripPath];
    imgViewDrip.image = imgDrip;
    
    imgCol = [[UIImage alloc] initWithContentsOfFile:imgColPath];
    imgViewCol.image = imgCol;
    
    imgViewMin.image = imgNumber[0];
    imgViewSec01.image = imgNumber[0];
    imgViewSec02.image = imgNumber[0];
    
    // Loading text
    steps = [[NSDictionary alloc]initWithContentsOfFile:descPath];
    
    NSArray *tmp = [[steps allKeys] sortedArrayUsingSelector:@selector(compare:)];
    /*for (int i=0; i<[tmp count]; i++)
    {
        NSLog(@"%@", [tmp objectAtIndex:i] ) ;
    }*/
    keys = [[NSArray alloc]initWithArray:tmp];
    
    msgView.text = [steps objectForKey:[keys objectAtIndex:0]];

    //msgView.text = [keys objectAtIndex:0];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnStartPress:(id)sender
{
    NSLog(@"Start Button Pressed");
}

-(IBAction)btnResetPress:(id)sender
{
    NSLog(@"Reset Button Pressed");
}

//------- Do when page disapper or alert message "your timer could be reset"

@end

//
//  TimerView.h
//  Assignment
//
//  Created by DK on 12/3/13.
//  Copyright (c) 2013 DK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerView : UIViewController
{
    UIImageView *imgViewDrip, *imgViewMin, *imgViewCol, *imgViewSec01, *imgViewSec02;
    UIImage *imgDrip, *imgNumber[10], *imgCol;
    //UILabel *msgView;
    UITextView *msgView;
    NSDictionary *steps;
    NSArray *keys;
}

@property (nonatomic,retain) IBOutlet UIImageView *imgViewDrip;
@property (nonatomic,retain) IBOutlet UIImageView *imgViewMin;
@property (nonatomic,retain) IBOutlet UIImageView *imgViewCol;
@property (nonatomic,retain) IBOutlet UIImageView *imgViewSec01;
@property (nonatomic,retain) IBOutlet UIImageView *imgViewSec02;
@property (nonatomic,retain) IBOutlet UITextView *msgView;

@property (nonatomic,retain) NSDictionary *steps;
@property (nonatomic,retain) NSArray *keys;

//@property (nonatomic,retain) UIImage *imgDrip;
//@property (nonatomic,retain) UIImage *imgNumber[10];
//@property (nonatomic,retain) UIImage *imgCol;

-(IBAction)btnStartPress:(id)sender;
-(IBAction)btnResetPress:(id)sender;

// sound
// plist load

@end

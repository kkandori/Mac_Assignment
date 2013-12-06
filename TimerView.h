//
//  TimerView.h
//  Assignment
//
//  Created by DK on 12/3/13.
//  Copyright (c) 2013 DK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface TimerView : UIViewController
{
    UIImageView *imgViewMin, *imgViewCol, *imgViewSec01, *imgViewSec02;
    UIImage *imgNumber[10], *imgCol;
    UITextView *msgView;

    NSDictionary *steps;
    NSArray *keys;
    NSTimer *timer;
    
    SystemSoundID m_beef1, m_beef2, m_beefEnd;
    
    int tickTime;
    int status;
    
    enum {
        eReset = 0,
        eStep1, eStep2, eStep3, eStep4
    }currentStatus;
}

@property (nonatomic,retain) IBOutlet UIImageView *imgViewDrip;
@property (nonatomic,retain) IBOutlet UIImageView *imgViewMin;
@property (nonatomic,retain) IBOutlet UIImageView *imgViewCol;
@property (nonatomic,retain) IBOutlet UIImageView *imgViewSec01;
@property (nonatomic,retain) IBOutlet UIImageView *imgViewSec02;
@property (nonatomic,retain) IBOutlet UITextView *msgView;
@property (nonatomic,retain) IBOutlet UIButton *startBtn;
@property (nonatomic,retain) IBOutlet UILabel *msg;


@property (nonatomic,retain) NSDictionary *steps;
@property (nonatomic,retain) NSArray *keys;
@property (nonatomic,retain) NSTimer *timer;

-(void)triggerTimer;
-(void)pauseTimer;
-(void)resetTimer;
-(void)setTimerImage:(int)min sec:(int)second;

-(IBAction)btnStartPress:(id)sender;
-(IBAction)btnResetPress:(id)sender;

@end

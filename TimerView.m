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
@synthesize msgView,startBtn;
@synthesize steps, keys,timer,msg;

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
    
    //-------- Loading images
    NSString *imgColPath = [[NSBundle mainBundle]pathForResource:@"colone" ofType:@"png"];
    NSString *imgNumPath[10];
    
    for (int i=0; i<10; i++) {
        NSString *tmp = [[NSString alloc]initWithFormat:@"%i", i ];
        imgNumPath[i] = [[NSBundle mainBundle]pathForResource:tmp ofType:@"png"];
        imgNumber[i] = [[UIImage alloc] initWithContentsOfFile:imgNumPath[i]];
    }
    
    imgCol = [[UIImage alloc] initWithContentsOfFile:imgColPath];
    imgViewCol.image = imgCol;

    [self setTimerImage:0 sec:0];       // render initial timer digit
    
    //----------Loading text
    NSString *descPath = [[NSBundle mainBundle]pathForResource:@"DripText" ofType:@"plist"];
    steps = [[NSDictionary alloc]initWithContentsOfFile:descPath];
    
    NSArray *tmp = [[steps allKeys] sortedArrayUsingSelector:@selector(compare:)];
    keys = [[NSArray alloc]initWithArray:tmp];
    msgView.text = [steps objectForKey:[keys objectAtIndex:eReset]];
    
    //-------------- Loading audio
    NSString *audioPath1 = [[NSBundle mainBundle]pathForResource:@"beep1" ofType:@"caf"];
    NSString *audioPath2 = [[NSBundle mainBundle]pathForResource:@"beep2" ofType:@"caf"];
    NSString *audioPath3 = [[NSBundle mainBundle]pathForResource:@"endcoffee" ofType:@"caf"];

    CFURLRef url1 = (CFURLRef)CFBridgingRetain([NSURL fileURLWithPath:audioPath1]);
    CFURLRef url2 = (CFURLRef)CFBridgingRetain([NSURL fileURLWithPath:audioPath2]);
    CFURLRef url3 = (CFURLRef)CFBridgingRetain([NSURL fileURLWithPath:audioPath3]);
    
    AudioServicesCreateSystemSoundID( url1 , &m_beef1);
    AudioServicesCreateSystemSoundID( url2 , &m_beef2);
    AudioServicesCreateSystemSoundID( url3 , &m_beefEnd);
    
    //-------------- Initialize variables
    tickTime = 0;
    NSLog(@"%i", tickTime);
    status = eReset;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)triggerTimer
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(targetMethod:) userInfo:nil repeats:YES];
    [startBtn setTitle:@"멈춤" forState:UIControlStateNormal];
    msg.text = @"잠깐 멈추고 싶으시면 멈춤을 눌러주세요.";
}

-(void)pauseTimer
{
    [timer invalidate];
    [startBtn setTitle:@"시작" forState:UIControlStateNormal];
    msg.text = @"시작을 누르면 타이머가 작동합니다.";
}

-(void)resetTimer
{
    [timer invalidate];
    [startBtn setTitle:@"시작" forState:UIControlStateNormal];
    tickTime = 0;
    msg.text = @"시작을 누르면 타이머가 작동합니다.";
}

-(void)setTimerImage:(int)min sec:(int)second
{
    if(min>10 || second>60)
        return;
    imgViewMin.image = imgNumber[min];
    imgViewSec01.image = imgNumber[second/10];
    imgViewSec02.image = imgNumber[second%10];
}

-(IBAction)btnStartPress:(id)sender
{
    [self setTimerImage:tickTime/60 sec:tickTime%60];
    
    if([timer isValid]==YES) // do pause!
    {
        [self pauseTimer];
        return;
    }
    
    [self triggerTimer];
    
    if(tickTime==0 && status==eReset) // first time
    {
        status = eStep1;
    }
    
    msgView.text = [steps objectForKey:[keys objectAtIndex:status]];
    //NSLog(@"%@", msgView.text);
    //NSLog(@"Start Button Pressed");
}

-(IBAction)btnResetPress:(id)sender
{
    [self resetTimer];
    [self setTimerImage:0 sec:0];
    status = eReset;
    
    msgView.text = [steps objectForKey:[keys objectAtIndex:status]];
    //NSLog(@"Reset Button Pressed");
}

-(void)targetMethod:(NSTimer *)timer
{
    tickTime++;
    [self setTimerImage:tickTime/60 sec:tickTime%60];
 
    switch(tickTime)
    {
        case 27:
        case 28:
        case 29:
            if(status!=eStep4)
            {
                //beep
                AudioServicesPlaySystemSound(m_beef1);
            }
            break;
        case 30:
            // beep
            if(status>=eStep1 && status<=eStep3)
            {
                AudioServicesPlaySystemSound(m_beef2);
                status++;
                //NSLog(@"%i",status);
                [self resetTimer];
            }
            break;
        case 57:
        case 58:
        case 59:
            if(status==eStep4)
            {
                //beep
                AudioServicesPlaySystemSound(m_beef1);
            }
            break;
        case 60:
            // beep
            if(status==eStep4)
            {
                AudioServicesPlaySystemSound(m_beefEnd);
                status=eReset;
                [self resetTimer];
            }
            break;
    }
    //NSLog(@"%i", tickTime);
}

@end

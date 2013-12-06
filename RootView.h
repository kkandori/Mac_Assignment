//
//  RootView.h
//  Assignment
//
//  Created by DK on 12/3/13.
//  Copyright (c) 2013 DK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimerView.h"
#import "HelpView.h"
#import "AboutView.h"

@interface RootView : UIViewController

@property(nonatomic,retain) TimerView *timerView;
@property(nonatomic,retain) HelpView *helpView;
@property(nonatomic,retain) AboutView *aboutView;

-(IBAction)moveToTimerView:(id)sender;
-(IBAction)moveToHelpView:(id)sender;
-(IBAction)moveToAboutView:(id)sender;

@end

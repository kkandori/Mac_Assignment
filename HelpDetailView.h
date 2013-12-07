//
//  HelpDetailView.h
//  Assignment
//
//  Created by DK on 12/3/13.
//  Copyright (c) 2013 DK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpDetailView : UIViewController <UIWebViewDelegate,UITextFieldDelegate>
{
    NSString *sName;
    //UIWebView *webView;
}
@property(nonatomic,retain) NSString *sName;

//@property(nonatomic,retain) IBOutlet UILabel *description;
@property(nonatomic,retain) IBOutlet UIWebView *webView;

@property(nonatomic,retain) IBOutlet UIButton *backBtn;
@property(nonatomic,retain) IBOutlet UIButton *forwardBtn;
@property(nonatomic,retain) IBOutlet UIButton *goBtn;
@property(nonatomic,retain) IBOutlet UITextField *addrTxt;

-(IBAction)pressBack:(id)sender;
-(IBAction)pressForward:(id)sender;
-(IBAction)goURL:(id)sender;
-(IBAction)keyResign:(id)sender;


@end

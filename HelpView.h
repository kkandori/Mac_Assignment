//
//  HelpView.h
//  Assignment
//
//  Created by DK on 12/3/13.
//  Copyright (c) 2013 DK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HelpDetailView.h"

@interface HelpView : UITableViewController
{
    NSArray *dataList;
    
    NSDictionary *steps;
    NSArray *keys;
}

@property(nonatomic,retain) HelpDetailView *detailView;

@property (nonatomic,retain) NSDictionary *steps;
@property (nonatomic,retain) NSArray *keys;

@end

//
//  HelpView.h
//  Assignment
//
//  Created by DK on 12/3/13.
//  Copyright (c) 2013 DK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HelpDetailView.h"

@interface HelpView : UITableViewController //<UITableViewDataSource, UITableViewDelegate>
{
    NSArray *dataList;
}

@property(nonatomic,retain) HelpDetailView *detailView;

@end

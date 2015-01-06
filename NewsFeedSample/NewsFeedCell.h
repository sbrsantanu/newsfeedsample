//
//  NewsFeedCell.h
//  NewsFeedSample
//
//  Created by OnurMac on 03/01/15.
//  Copyright (c) 2015 com.pactera.iosteam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RWLabel.h"
#import "UIImageView+WebCache.h"

@interface NewsFeedCell : UITableViewCell

@property (nonatomic, strong) UILabel *ContentText;

@property (weak, nonatomic) IBOutlet UITextView *Context;


@property (weak, nonatomic) IBOutlet UILabel *Title;

@property (weak, nonatomic) IBOutlet UIImageView *imgNews;

@property (nonatomic) float requiredCellHeight;




@end

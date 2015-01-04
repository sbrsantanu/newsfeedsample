//
//  NewsFeedCell.h
//  NewsFeedSample
//
//  Created by OnurMac on 03/01/15.
//  Copyright (c) 2015 com.pactera.iosteam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsFeedCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblMainTitle;

@property (weak, nonatomic) IBOutlet UITextView *lblSubtitle;

@property (weak, nonatomic) IBOutlet UIImageView *imgNews;

@end

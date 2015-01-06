//
//  NewsFeedCell.m
//  NewsFeedSample
//
//  Created by OnurMac on 03/01/15.
//  Copyright (c) 2015 com.pactera.iosteam. All rights reserved.
//

#import "NewsFeedCell.h"
#import "UIImageView+WebCache.h"

@implementation NewsFeedCell


- (void)layoutSubviews
{
    [super layoutSubviews];
    CGSize expectedSize = [self.Context.text boundingRectWithSize:CGSizeMake(207, 250) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: self.Context.font} context:nil].size;
    self.Context.frame = CGRectMake(16, 36, 207, expectedSize.height+30);
    
    _requiredCellHeight = self.Context.frame.size.height;
    
}







@end

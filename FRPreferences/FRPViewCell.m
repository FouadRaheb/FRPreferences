//
//  FRPViewCell.m
//  FRPreferences
//
//  Created by Fouad Raheb on 7/3/15.
//  Copyright (c) 2015 F0u4d. All rights reserved.
//

#import "FRPViewCell.h"

@implementation FRPViewCell

+ (instancetype)cellWithHeight:(int)height cellBlock:(FRPViewCellBlock)block {
    return [[self alloc] cellWithHeight:height cellBlock:block];
}

- (instancetype)cellWithHeight:(int)height cellBlock:(FRPViewCellBlock)block {
    FRPViewCell *cell = [super initWithTitle:nil setting:nil];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.height = height;
    block(self);
    return cell;
}

-(void)layoutSubviews {
    [super layoutSubviews];
}

-(void)addSubview:(UIView *)view {
    // The separator has a height of 0.5pt on a retina display and 1pt on non-retina.
    // Prevent subviews with this height from being added.
    if (self.hideSeperators && CGRectGetHeight(view.frame)*[UIScreen mainScreen].scale == 1) {
        return;
    }
    [super addSubview:view];
}

@end
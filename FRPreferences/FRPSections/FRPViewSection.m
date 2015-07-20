//
//  FRPViewSection.m
//  FRPreferences
//
//  Created by Fouad Raheb on 7/3/15.
//  Copyright (c) 2015 F0u4d. All rights reserved.
//

#import "FRPViewSection.h"

@implementation FRPViewSection

+ (instancetype)sectionWithHeight:(int)height cellBlock:(FRPViewCellBlock)block {
    return [[self alloc] initWithHeight:height cellBlock:block];
}

- (instancetype)initWithHeight:(int)height cellBlock:(FRPViewCellBlock)block {
    FRPViewSection *section = [[super class] sectionWithTitle:nil footer:nil];
    FRPViewCell *cell = [FRPViewCell cellWithHeight:height cellBlock:^(UITableViewCell *cell) {
        block(cell);
    }];
    cell.hideSeperators = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [section addCell:cell];
    return section;
}

@end

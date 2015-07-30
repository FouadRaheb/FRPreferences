//
//  FRPSegmentCell.m
//  FRPreferences
//
//  Created by Fouad Raheb on 7/19/15.
//  Copyright (c) 2015 F0u4d. All rights reserved.
//

#import "FRPSegmentCell.h"

@interface FRPSegmentCell ()
@property (nonatomic, strong) UISegmentedControl *segment;
@property (nonatomic, strong) NSArray *items;
@end

@implementation FRPSegmentCell

+ (instancetype)cellWithTitle:(NSString *)title setting:(FRPSettings *)setting items:(NSArray *)items postNotification:(NSString *)notification changeBlock:(FRPValueChanged)block {
    return [[self alloc] cellWithTitle:title setting:setting items:items postNotification:notification changeBlock:block];
}

- (instancetype)cellWithTitle:(NSString *)title setting:(FRPSettings *)setting items:(NSArray *)items postNotification:(NSString *)notification changeBlock:(FRPValueChanged)block {
    FRPSegmentCell *cell = [super initWithTitle:title setting:setting];
    cell.setting = setting;
    cell.postNotification = notification;
    cell.valueChanged = ^(id sender) {
        if (block) block(sender);
    };
    self.items = items;
    self.segment = [[UISegmentedControl alloc] initWithItems:self.items];
    [self.segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    self.segment.selectedSegmentIndex = [self.items indexOfObject:cell.setting.value];
    cell.accessoryView = self.segment;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)segmentAction:(UISegmentedControl *)segment {
    NSString *selectedItem = [self.items objectAtIndex:segment.selectedSegmentIndex];
    self.setting.value = selectedItem;
    self.valueChanged(selectedItem);
    [[NSNotificationCenter defaultCenter] postNotificationName:self.postNotification object:selectedItem];
}


-(void)layoutSubviews {
    [super layoutSubviews];
    self.segment.tintColor = self.tintUIColor;
}
@end
//
//  FRPSwitchCell.m
//  FRPreferences
//
//  Created by Fouad Raheb on 7/2/15.
//  Copyright (c) 2015 F0u4d. All rights reserved.
//

#import "FRPSwitchCell.h"

@interface FRPSwitchCell ()
@property (nonatomic, strong) UISwitch *mySwitch;
@end

@implementation FRPSwitchCell

+ (instancetype)cellWithTitle:(NSString *)title setting:(FRPSettings *)setting postNotification:(NSString *)notification changeBlock:(FRPValueChanged)block {
    return [[self alloc] cellWithTitle:title setting:setting postNotification:notification changeBlock:block];
}


- (instancetype)cellWithTitle:(NSString *)title setting:(FRPSettings *)setting postNotification:(NSString *)notification changeBlock:(FRPValueChanged)block {
    FRPSwitchCell *cell = [super initWithTitle:title setting:setting];
    cell.postNotification = notification;
    cell.valueChanged = ^(id sender) {
        if (block) block(sender);
    };
    self.mySwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    [self.mySwitch setOn:[self.setting.value boolValue] animated:NO];
    [self.mySwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    cell.accessoryView = self.mySwitch;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)switchChanged:(UISwitch *)switchItem {
    self.setting.value = [NSNumber numberWithBool:[switchItem isOn]];
    self.valueChanged(switchItem);
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.mySwitch.onTintColor = self.tintUIColor;
    self.mySwitch.tintColor = self.tintUIColor;
}
@end

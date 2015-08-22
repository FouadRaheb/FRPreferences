//
//  FRPSwitchCell.h
//  FRPreferences
//
//  Created by Fouad Raheb on 7/2/15.
//  Copyright (c) 2015 F0u4d. All rights reserved.
//

#import "FRPCell.h"

@interface FRPSwitchCell : FRPCell
+ (instancetype)cellWithTitle:(NSString *)title setting:(FRPSettings *)setting postNotification:(NSString *)notification changeBlock:(FRPValueChanged)block;
@property (nonatomic, strong) UISwitch *switchView;
@end

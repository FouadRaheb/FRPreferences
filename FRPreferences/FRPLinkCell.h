//
//  FRPLinkCell.h
//  FRPreferences
//
//  Created by Fouad Raheb on 7/2/15.
//  Copyright (c) 2015 F0u4d. All rights reserved.
//

#import "FRPCell.h"

@interface FRPLinkCell : FRPCell
+ (instancetype)cellWithTitle:(NSString *)title selectedBlock:(FRPValueChanged)block;
@end


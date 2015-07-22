//
//  FRPrefs.h
//  FRPreferences
//
//  Created by Fouad Raheb on 7/3/15.
//  Copyright (c) 2015 F0u4d. All rights reserved.
//

#import "FRPreferences.h"
#import "FRPSettings.h"

#import "FRPViewSection.h"
#import "FRPSection.h"

#import "FRPSwitchCell.h"
#import "FRPTextFieldCell.h"
#import "FRPLinkCell.h"
#import "FRPSliderCell.h"
#import "FRPListCell.h"
#import "FRPSegmentCell.h"
#import "FRPValueCell.h"


id FRPValue(NSString *key);
BOOL FRPBool(NSString *key);
float FRPFloat(NSString *key);
double FRPDouble(NSString *key);


id FRPValue(NSString *key) {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

BOOL FRPBool(NSString *key) {
    return [[[NSUserDefaults standardUserDefaults] objectForKey:key] boolValue];
}

float FRPFloat(NSString *key) {
    return [[[NSUserDefaults standardUserDefaults] objectForKey:key] floatValue];
}

double FRPDouble(NSString *key) {
    return [[[NSUserDefaults standardUserDefaults] objectForKey:key] doubleValue];
}
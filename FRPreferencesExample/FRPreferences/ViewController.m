//
//  ViewController.m
//  FRPreferences
//
//  Created by Fouad Raheb on 5/5/15.
//  Copyright (c) 2015 F0u4d. All rights reserved.
//

#import "ViewController.h"
#import "FRPrefs.h"

#define greenColor [UIColor colorWithRed:1/255.0f green:152/255.0f blue:117/255.0f alpha:1.0f]

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(loadNewSettings:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Show Table" forState:UIControlStateNormal];
    button.frame = CGRectMake(self.view.frame.size.width/2 - 160/2, self.view.frame.size.height/2 - 40/2, 160.0, 40.0);
    [self.view addSubview:button];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button2 addTarget:self action:@selector(logCurrentValue:)
     forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"Log the current values" forState:UIControlStateNormal];
    button2.frame = CGRectMake(self.view.frame.size.width/2 - 160/2, (self.view.frame.size.height/2 - 40/2)+ 60, 160.0, 40.0);
    [self.view addSubview:button2];
}


-(void)loadNewSettings:(id)sender {
    FRPViewSection *headerSection = [FRPViewSection sectionWithHeight:70 cellBlock:^(UITableViewCell *cell) {
       cell = [self cellAdditions:cell];
        /* design your cell as you wish */
    }];
    
    
    
    FRPSection *section1 = [FRPSection sectionWithTitle:@"Section 1 Title" footer:@"Some footer for section 1"];

    
    
    FRPSwitchCell *switchCell = [FRPSwitchCell cellWithTitle:@"Switch 1"
                                                     setting:[FRPSettings settingsWithKey:@"Switch1" defaultValue:@NO]
                                            postNotification:nil
                                                 changeBlock:^(UISwitch *switchView) {
                                                                NSLog(@"switch 1 is: %@",[(UISwitch *)switchView isOn]?@"ENABLED":@"DISABLED");
                                                            }];
//    [switchCell.switchView setOnTintColor:[UIColor colorWithRed:0 green:0.545 blue:0.894 alpha:1]];
    [section1 addCell:switchCell];
    
    
    
    FRPTextFieldCell *textFieldCell = [FRPTextFieldCell cellWithTitle:@"Text Field 1"
                                                              setting:[FRPSettings settingsWithKey:@"Field1" defaultValue:@""]
                                                         placeholder:@"Enter Some text"
                                                    postNotification:nil
                                                         changeBlock:^(UITextField *field) {
                                                                NSLog(@"textfield 1 text is: %@",[(UITextField *)field text]);
                                                            }];
    [section1 addCell:textFieldCell];
    
    
    
    [section1 addCell:[FRPLinkCell cellWithTitle:@"Link Cell" selectedBlock:^(id sender) {
        NSLog(@"%@ is selected",[sender class]);
    }]];
    
    
    
    FRPListCell *listCell = [FRPListCell cellWithTitle:@"List Cell"
                                               setting:[FRPSettings settingsWithKey:@"ListCellKey" defaultValue:@"Value1"]
                                                 items:@[@"Item 1",@"Item 2",@"Item 3",@"Item 4"]
                                                 value:@[@"value1",@"value2",@"value3",@"value4"]
                                       popViewOnSelect:YES
                                      postNotification:nil
                                          changedBlock:^(NSString *value) {
                                                            NSLog(@"Did Select Value: %@",value);
                                                        }];
    [section1 addCell:listCell];
    
    
    
    FRPSliderCell *sliderCell = [FRPSliderCell cellWithTitle:@"Slider Cell"
                                                     setting:[FRPSettings settingsWithKey:@"SliderKey" defaultValue:[NSNumber numberWithFloat:150]]
                                                         min:0.0
                                                         max:255.0
                                            postNotification:nil
                                                 changeBlock:^(UISlider *slider) {
                                                                NSLog(@"Slider Value changed: %f",[(UISlider *)slider value]);
                                                        }];
    [section1 addCell:sliderCell];
    
    
    
    FRPSegmentCell *segmentCell = [FRPSegmentCell cellWithTitle:@"Segment Cell"
                                                        setting:[FRPSettings settingsWithKey:@"SegmentValue" defaultValue:@"50"]
                                                          items:@[@"20",@"50",@"100",@"All"]
                                               postNotification:nil
                                                    changeBlock:^(NSString *item) {
                                                        NSLog(@"Selected Item: %@",item);
                                                    }];
    [section1 addCell:segmentCell];
    
    
    FRPViewCell *viewCell = [FRPViewCell cellWithHeight:60 cellBlock:^(UITableViewCell *cell) {
        cell.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1.0f];
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, 60)];
        label.text = @"Customized Cell View";
        label.textColor = greenColor;
        label.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:label];
    }];
    [section1 addCell:viewCell];
    
    
    [section1 addCell:[FRPValueCell cellWithTitle:@"Title" detail:@"Detail Text"]];

    
    /* ANOTHER SECTION */
    
     FRPSection *section2 = [FRPSection sectionWithTitle:@"Section 2 Title" footer:@"Some footer for section 2"];
    
    
    [section2 addCell:[FRPSwitchCell cellWithTitle:@"Switch 2" setting:[FRPSettings settingsWithKey:@"Switch1" defaultValue:@NO] postNotification:nil changeBlock:^(id sender) {
        NSLog(@"switch 1 is: %@",[(UISwitch *)sender isOn]?@"ENABLED":@"DISABLED");
    }]];

    
    FRPLinkCell *subTableLinkCell = [FRPLinkCell cellWithTitle:@"New Settings Window" selectedBlock:^(id sender) {
        
        FRPSection *subSection1 = [FRPSection sectionWithTitle:@"Section 1 Title" footer:@"Some footer for section 1"];
        [subSection1 addCell:[FRPSwitchCell cellWithTitle:@"Switch 1" setting:[FRPSettings settingsWithKey:@"Switch1" defaultValue:@NO] postNotification:nil changeBlock:^(id sender) { }]];
        
        FRPSection *subSection2 = [FRPSection sectionWithTitle:@"Section 2 Title" footer:@"Some footer for section 1"];
        [subSection2 addCell:[FRPSwitchCell cellWithTitle:@"Switch 2" setting:[FRPSettings settingsWithKey:@"Switch2" defaultValue:@NO] postNotification:nil changeBlock:^(id sender) { }]];
        
        FRPreferences *subTable = [FRPreferences tableWithSections:@[subSection1,subSection2] title:@"Sub Table" tintColor:greenColor];
        [self.navigationController pushViewController:subTable animated:YES];
        
    }];
    
    [section2 addCell:subTableLinkCell];

    [section2 addCell:[FRPDeveloperCell cellWithTitle:@"Fouad Raheb" detail:@"@iF0u4d" image:[UIImage imageNamed:@"logo.png"] twitter:@"iF0u4d"]]; // Or any url https://twitter.com/iF0u4d
    
    
    FRPreferences *table = [FRPreferences tableWithSections:@[headerSection,section1,section2]
                                                      title:@"FRPreferences"
                                                  tintColor:greenColor];
    
//    table.plistPath = @"some/path/to/file.plist"; // You can set a plistPath if you wish to save values into plist file
    
    UIBarButtonItem *heart = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"heart.png"] style:UIBarButtonItemStylePlain target:self action:@selector(shareTapped:)];
    table.navigationItem.rightBarButtonItem = heart;
    
    [self.navigationController pushViewController:table animated:YES];

}


-(void)logCurrentValue:(id)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"Switch1: %@",[[userDefaults objectForKey:@"Switch1"] boolValue]?@"Enabled":@"Disabled");
    NSLog(@"Field1: %@",[userDefaults objectForKey:@"Field1"]);
    NSLog(@"SliderKey2: %f",[[userDefaults objectForKey:@"SliderKey2"] floatValue]);
    NSLog(@"List Cell Value: %@",[userDefaults objectForKey:@"ListKey"]);
}


-(UITableViewCell *)cellAdditions:(UITableViewCell *)cell {
    CGFloat screenWidth  = [[UIScreen mainScreen] bounds].size.width;
    cell.backgroundColor = [UIColor clearColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, -5, screenWidth, 60)];
    label.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
    [label setText:@"FRPreferences"];
    [label setBackgroundColor:[UIColor clearColor]];
    label.textColor = [UIColor blackColor];
    [label setShadowColor:[UIColor colorWithRed:1/255.0f green:152/255.0f blue:117/255.0f alpha:1.0f]];
    [label setShadowOffset:CGSizeMake(1,1)];
    label.textAlignment = NSTextAlignmentCenter;
    
    UILabel *underLabel;
    underLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, screenWidth, 60)];
    underLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
    [underLabel setText:@"Thank you for using our preferences!"];
    [underLabel setBackgroundColor:[UIColor clearColor]];
    underLabel.textColor = [UIColor grayColor];
    underLabel.textAlignment = NSTextAlignmentCenter;
    
    [cell.contentView addSubview:label];
    [cell.contentView addSubview:underLabel];
    return cell;
}

-(void)shareTapped:(id)sender {
    NSLog(@"Share Tapped!");
}

@end









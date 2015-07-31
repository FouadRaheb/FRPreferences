//
//  FRPDeveloperCell.m
//  FRPreferences
//
//  Created by Fouad Raheb on 7/3/15.
//  Copyright (c) 2015 F0u4d. All rights reserved.
//

#import "FRPDeveloperCell.h"

@interface FRPDeveloperCell ()
@property (nonatomic, assign) NSString *twitter;
@property (nonatomic, assign) UIImage *image;
@end

@implementation FRPDeveloperCell

+ (instancetype)cellWithTitle:(NSString *)title detail:(NSString *)detail image:(UIImage *)image twitter:(NSString *)twitter {
    return [[self alloc] cellWithTitle:title detail:detail image:image twitter:twitter];
}

- (instancetype)cellWithTitle:(NSString *)title detail:(NSString *)detail image:(UIImage *)image twitter:(NSString *)twitter {
    FRPDeveloperCell *cell = [super initWithTitle:title setting:nil];
    cell.twitter = twitter;
    cell.image = image;
    cell.detailTextLabel.text = detail;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    CGSize size = CGSizeMake(35,35);
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    [self.image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newThumbnail = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    cell.imageView.image = newThumbnail;;
    return cell;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2;
    self.imageView.clipsToBounds = YES;
}

-(void)didSelectFromTable:(FRPreferences *)viewController {
    NSIndexPath *indexPath = [viewController.tableView indexPathForCell:self];
    [self twitterForUsername:self.twitter];
    [viewController.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)twitterForUsername:(NSString *)username {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetbot:///user_profile/" stringByAppendingString:username]]];
    
    else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitterrific:///profile?screen_name=" stringByAppendingString:username]]];
    
    else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetings:///user?screen_name=" stringByAppendingString:username]]];
    
    else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]])
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitter://user?screen_name=" stringByAppendingString:username]]];
    else
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"https://mobile.twitter.com/" stringByAppendingString:username]]];
}
@end
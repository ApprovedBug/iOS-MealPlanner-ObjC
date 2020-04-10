//
//  APBLoginView.m
//  APBMealPlanner
//
//  Created by ApprovedBug on 10/04/2020.
//  Copyright © 2020 ApprovedBug. All rights reserved.
//

#import "APBLoginView.h"
#import <FLKAutoLayout/FLKAutoLayout.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface APBLoginView() {
    FBSDKLoginButton *_loginButton;
    UILabel *_welcomeLabel;
    UILabel *_promptLabel;
}

@end

@implementation APBLoginView

#pragma Subviews

- (UILabel *)welcomeLabel {

    if (!_welcomeLabel) {
        _welcomeLabel = [[UILabel alloc] init];
        [_welcomeLabel setText:NSLocalizedString(@"login_welcome", "")];
        [_welcomeLabel setTextColor:[UIColor whiteColor]];
        [_welcomeLabel setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleLargeTitle]];
        _welcomeLabel.adjustsFontForContentSizeCategory = YES;
    }
    return _welcomeLabel;
}

- (UILabel *)promptLabel {

    if (!_promptLabel) {
        _promptLabel = [[UILabel alloc] init];
        [_promptLabel setText:NSLocalizedString(@"login_prompt", "")];
        [_promptLabel setTextColor:[UIColor whiteColor]];
        [_promptLabel setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]];
        _promptLabel.adjustsFontForContentSizeCategory = YES;
    }
    return _promptLabel;
}

- (FBSDKLoginButton *)loginButton {

    if (!_loginButton) {
        _loginButton = [[FBSDKLoginButton alloc] init];
    }
    return _loginButton;
}

#pragma Setup view

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupSubviews];
        [self setupAutoLayout];
    }
    return self;
}

- (void)setupSubviews {
    [self addSubview:self.welcomeLabel];
    [self addSubview:self.promptLabel];
    [self addSubview:self.loginButton];
}

- (void)setupAutoLayout {

    // welcome label
    [self.welcomeLabel alignCenterYWithView:self predicate:@"-120"];
    [self.welcomeLabel alignCenterXWithView:self predicate:@"0"];

    // prompt label
    [self.promptLabel alignAttribute:NSLayoutAttributeTop
                         toAttribute:NSLayoutAttributeBottom
                              ofView:self.welcomeLabel
                           predicate:@"120"];
    [self.promptLabel alignCenterXWithView:self predicate:@"0"];

    // login button
    [self.loginButton alignAttribute:NSLayoutAttributeTop
                         toAttribute:NSLayoutAttributeBottom
                              ofView:self.promptLabel
                           predicate:@"24"];
    [self.loginButton alignCenterXWithView:self predicate:@"0"];
}

@end

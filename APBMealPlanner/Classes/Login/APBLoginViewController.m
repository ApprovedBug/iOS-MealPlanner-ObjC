//
//  APBLoginViewController.m
//  APBMealPlanner
//
//  Created by ApprovedBug on 08/04/2020.
//  Copyright © 2020 ApprovedBug. All rights reserved.
//

#import "APBLoginViewController.h"
#import "APBLoginView.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface APBLoginViewController () <FBSDKLoginButtonDelegate>

@end

@implementation APBLoginViewController

- (void)loadView {
    [super loadView];

    APBLoginView *view = [[APBLoginView alloc] init];
    [[view loginButton] setDelegate:self];
    self.view = view;
}

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {

}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {

}

- (BOOL)loginButtonWillLogin:(FBSDKLoginButton *)loginButton {
    return YES;
}

@end

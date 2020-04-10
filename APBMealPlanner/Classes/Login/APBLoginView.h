//
//  APBLoginView.h
//  APBMealPlanner
//
//  Created by ApprovedBug on 10/04/2020.
//  Copyright © 2020 ApprovedBug. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface APBLoginView : UIView

- (FBSDKLoginButton *)loginButton;

@end

NS_ASSUME_NONNULL_END

//
//  APBMealPlannerUITests.m
//  APBMealPlannerUITests
//
//  Created by ApprovedBug on 04/04/2020.
//  Copyright © 2020 ApprovedBug. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface APBMealPlannerUITests : XCTestCase {
    XCUIApplication *_app;
}

@end

@implementation APBMealPlannerUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [super setUp];

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    _app = [[XCUIApplication alloc] init];
    _app.launchArguments = @[@"-AppleLanguages", @"(es)", @"-AppleLocale", @"es_ES"];
    [_app launch];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testLoginScreen {

    NSBundle *englishBundle = [NSBundle bundleForClass:[APBMealPlannerUITests classForCoder]];
    NSString *path = [englishBundle pathForResource:@"es" ofType:@"lproj" ];
    NSBundle *bundle = [NSBundle bundleWithPath:path];

    NSString *titleString =  NSLocalizedStringFromTableInBundle(@"login_welcome", @"Localizable", bundle, @"");
    NSString *promptString = NSLocalizedStringFromTableInBundle(@"login_prompt", @"Localizable", bundle, @"");
    NSString *continueString = NSLocalizedStringFromTableInBundle(@"continue_with_facebook", @"Localizable", bundle, @"");

    XCUIElement *titleLabel = _app.staticTexts[titleString];
    XCUIElement *promptLabel = _app.staticTexts[promptString];
    XCUIElement *continueButton = _app.buttons[continueString];

    XCTAssertTrue(titleLabel.exists);
    XCTAssertTrue(promptLabel.exists);
    XCTAssertTrue(continueButton.exists);

    __weak __typeof__(self)weakSelf = self;
    __weak __typeof__(_app)weakApp = _app;

    [self addUIInterruptionMonitorWithDescription:@"Sign in alert" handler:^BOOL(XCUIElement * _Nonnull interruptingElement) {
        __typeof__(self) self = weakSelf;
        XCUIElement *continueAlertButton = interruptingElement.buttons[@"Continue"];

        if (continueAlertButton.exists) {
            [continueAlertButton tap];

            sleep(5);

            XCUIElement *webview = weakApp.webViews.firstMatch;
            XCUIElement *emailTextField = webview.textFields.firstMatch;
            XCUIElement *passwordTextField = webview.secureTextFields.firstMatch;

            XCTAssertTrue(webview.exists);
            XCTAssertTrue(emailTextField.exists);
            XCTAssertTrue(passwordTextField.exists);

            return true;
        }

        return false;
    }];

    [continueButton tap];

    sleep(1);

    [_app swipeUp];
}

- (void)testLaunchPerformance {
    if (@available(macOS 10.15, iOS 13.0, tvOS 13.0, *)) {
        // This measures how long it takes to launch your application.
        [self measureWithMetrics:@[XCTOSSignpostMetric.applicationLaunchMetric] block:^{
            [[[XCUIApplication alloc] init] launch];
        }];
    }
}

@end

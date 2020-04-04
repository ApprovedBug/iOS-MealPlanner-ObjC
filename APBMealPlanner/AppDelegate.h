//
//  AppDelegate.h
//  APBMealPlanner
//
//  Created by Moseley, Jack, Vodafone Group on 04/04/2020.
//  Copyright © 2020 ApprovedBug. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentCloudKitContainer *persistentContainer;

- (void)saveContext;


@end


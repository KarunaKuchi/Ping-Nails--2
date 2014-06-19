//
//  AppDelegate.h
//  Ping Nails
//
//  Created by Taya technologies on 03/05/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SalesViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

//here app delegate data variable creation
@property (strong, nonatomic) NSMutableString *dataName,*dataPrice,*dataSection,*dataRow;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end

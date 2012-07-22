//
//  AppDelegate.m
//  Reign of Error
//
//  Created by Andrew Pontious on 7/21/12.
//  Copyright (c) 2012 Andrew Pontious. All rights reserved.
//

#import "AppDelegate.h"

#import "ErrorDocument.h"
#import "ViewController.h"

@interface AppDelegate ()

@property (strong, nonatomic) ErrorDocument *errorDocument;

@property (strong, nonatomic) ViewController *viewController;

@end

@implementation AppDelegate

@synthesize window = _window;

@synthesize errorDocument = _errorDocument;

@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Make a dummy file, if it's not there already, so UIDocument APIs will happen.
    
    NSURL *documentsDirectoryURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *fileURL = [documentsDirectoryURL URLByAppendingPathComponent:@"Dummy.txt"];
    if ([fileURL checkResourceIsReachableAndReturnError:nil] == NO) {
        [@"Dummy" writeToURL:fileURL atomically:NO encoding:NSUTF8StringEncoding error:nil];
    }
    
    _errorDocument = [[ErrorDocument alloc] initWithFileURL:fileURL];

    if ([fileURL checkResourceIsReachableAndReturnError:nil] == YES) {
        [_errorDocument openWithCompletionHandler:^(BOOL success) {
            NSLog(@"Open succeeded: %d", success);
        }];
    }

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
    } else {
        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil];
    }
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end

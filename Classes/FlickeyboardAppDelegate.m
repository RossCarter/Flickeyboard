//  FlickeyboardAppDelegate.m
//  Created by Ross Carter on 9/13/10.
//	This software is provided as is, without any express or implied warranty. 
//	In no event will the author be held liable for any damages arising from 
//	the use of this software.
//	Permission is granted to anyone to use this software for any purpose,
//	including commercial applications, and to alter it and redistribute it
//	freely, subject to the following restrictions:
//	1. The origin of this software must not be misrepresented; you must not
//	claim that you wrote the original software. If you use this software in a 
//	product, an acknowledgment in the product documentation would be appreciated 
//	but is not required.
//	2. Altered source versions must be plainly marked as such, and must not be
//	misrepresented as being the original software.
//	3. This notice may not be removed or altered from any source distribution.


#import "FlickeyboardAppDelegate.h"
#import "FlickeyboardViewController.h"

@implementation FlickeyboardAppDelegate

@synthesize window;
@synthesize viewController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end

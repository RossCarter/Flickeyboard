//  FlickeyboardViewController.m
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


#import "FlickeyboardViewController.h"
#import "Flickeyboard.h"


@implementation FlickeyboardViewController


- (void)viewDidLoad {
    [super viewDidLoad];
	[self applyFlickeyBoard:YES];
	[self.fvcTextView becomeFirstResponder];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight;
}

- (void)viewDidUnload {
	self.fvcTextView = nil;
	self.fvcFlickeyBoard = nil;
	self.fbSwitch = nil;
}

- (void)dealloc {
    [fvcTextView release];
	[fvcFlickeyBoard release];
	[fbSwitch release];
	[super dealloc];
}


#pragma mark -
#pragma mark utility methods

- (void)applyFlickeyBoard:(BOOL)flag {
	if (flag) {
		if (fvcFlickeyBoard == nil) {
			fvcFlickeyBoard = [[Flickeyboard alloc] initWithFrame:CGRectMake(0, 0, 1024, 352)];
		}
		self.fvcTextView.inputView = self.fvcFlickeyBoard;
	} else {
		self.fvcTextView.inputView = nil;
	}
	[self.fvcTextView reloadInputViews];
}


#pragma mark -
#pragma mark IBActions

- (IBAction)actionSwitch:(id)sender {
	BOOL flag = fbSwitch.on;
	[self applyFlickeyBoard:flag];
}


#pragma mark -
#pragma mark synthesize

@synthesize fvcTextView, fvcFlickeyBoard, fbSwitch;



@end

//  FlickeyboardViewController.h
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


#import <UIKit/UIKit.h>

@class Flickeyboard;


@interface FlickeyboardViewController : UIViewController {
	UITextView					*fvcTextView;
	Flickeyboard				*fvcFlickeyBoard;
	
	UISwitch					*fbSwitch;
}

@property (retain, nonatomic) IBOutlet UITextView *fvcTextView;
@property (retain, nonatomic) IBOutlet Flickeyboard *fvcFlickeyBoard;

@property (retain, nonatomic) IBOutlet UISwitch *fbSwitch;


#pragma mark -
#pragma mark utility methods

- (void)applyFlickeyBoard:(BOOL)flag;
//	Sets the textView keyboard to either Flickeyboard or standard keyboard.


#pragma mark -
#pragma mark IBActions

- (IBAction)actionSwitch:(id)sender;
//	Sends sender state to applyFlickeyboard:.

@end


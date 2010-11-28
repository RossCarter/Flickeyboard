//  Flickeyboard.h
//  Created by Ross T Carter on 10/6/10. 
//	Copyright 2010 Ross T Carter. All rights reserved.
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


//	UIView subclass that replaces the system keyboard.

#import <UIKit/UIKit.h>

@class FBKeyView;

typedef enum {
	FBSwipeNone = 0,
	FBSwipeLeft,
	FBSwipeRight,
	FBSwipeUp,
	FBSwipeDown,
	FBSwipeUpLeft,
	FBSwipeDownRight
} FBSwipeType;


@interface Flickeyboard : UIView {
	UITextView		*fbTextView;
	BOOL			fbSelectKeyIsDown;
	BOOL			fbSpaceKeyIsDown;
	BOOL			fbIgnoreSpaceKeyUp;
}

@property (assign, nonatomic) UITextView *fbTextView;
// weak reference to avoid retain cycle


#pragma mark -
#pragma mark methods sent by keys

- (void)keyDidBeginTouch:(FBKeyView *)keyView;

- (void)key:(FBKeyView *)keyView didEndTouchWithSwipeType:(FBSwipeType)swipeType;

- (void)key:(FBKeyView *)keyView didSendTapCount:(NSUInteger)tapCount;


#pragma mark -
#pragma mark commands

- (void)doCommandForKey:(FBKeyView *)key swipeType:(FBSwipeType)swipeType;
// Handles keys that perform commands, such as backspace.

- (void)doSpaceCommandForKey:(FBKeyView *)key;
//	Handles keys tapped while space (command) key is down.

- (void)backspace;

- (void)moveLeft;
- (void)moveRight;
- (void)moveUp;
- (void)moveDown;
- (void)home;
- (void)end;


#pragma mark -
#pragma mark key management

- (CGRect)frameForKeyTag:(NSInteger)tag;
// Helper for addKeyWithTag:.

- (void)addKeyWithTag:(NSInteger)tag;
//	Creates a key view and sets its labels and unichar values.

- (void)addKeys;
// Calls addKeyWithTag: with values 0 through 37.

- (NSString *)stringForTag:(NSInteger)tag;
- (NSString *)upStringForTag:(NSInteger)tag;
- (NSString *)rightStringForTag:(NSInteger)tag;
- (NSString *)downStringForTag:(NSInteger)tag;
- (NSString *)leftStringForTag:(NSInteger)tag;


@end


//-------------------------------------------------------
//		FBKeyView
//		These views comprise the individual keys
//-------------------------------------------------------

@interface FBKeyView : UIButton {
	CGPoint					fbFirstTouchLocation;
	// Scratch variable for determining swipe direction.
	
	NSString				*fbLabel;
	NSString				*fbLabelUp;
	NSString				*fbLabelRight;
	NSString				*fbLabelDown;
	NSString				*fbLabelLeft;
	// The strings that are drawn on the key.
	
	unichar					charCenter;
	unichar					charUp;
	unichar					charRight;
	unichar					charDown;
	unichar					charLeft;
	// The characters inserted by the key.
	
	BOOL					isCommand;
	// Not yet implemented. Will denote keys that do not insert text, but rather perform commands.
	
	BOOL					recognizesUpLeft;
	BOOL					recognizesDownRight;
	// At least one key (the cursor movement key) recognizes these two swipe directions. Normal keys recognize only up, down, right, left.
}

@property (copy, nonatomic) NSString *label;
@property (copy, nonatomic) NSString *labelUp;
@property (copy, nonatomic) NSString *labelDown;
@property (copy, nonatomic) NSString *labelRight;
@property (copy, nonatomic) NSString *labelLeft;

@property (nonatomic) unichar charCenter;
@property (nonatomic) unichar charUp;
@property (nonatomic) unichar charRight;
@property (nonatomic) unichar charDown;
@property (nonatomic) unichar charLeft;
@property (nonatomic) BOOL recognizesUpLeft;
@property (nonatomic) BOOL recognizesDownRight;


#pragma mark -
#pragma mark utility methods

- (FBSwipeType)swipeTypeForDeltaX:(CGFloat)deltaX deltaY:(CGFloat)deltaY;
//	Called by touchesEnded:withEvent: to determine the swipe direction.

- (void)resetFirstTouchLocation;
//	Not sure this is needed. 

- (void)drawLabelGlyphs;
- (void)drawBackspaceLabel;
- (void)drawReturnLabel;
- (void)drawArrowsLabel;
- (void)drawSelectLabel;
- (void)drawSpacebarLabel;
- (void)drawHideLabel;
//	Helper methods for drawRect:.


@end


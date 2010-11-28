//  Flickeyboard.m
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


#import "Flickeyboard.h"


@implementation Flickeyboard


#pragma mark -
#pragma mark overrides

- (void)dealloc {
	[super dealloc];
}

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self addKeys];
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(textViewDidBeginEditing:)
													 name:UITextViewTextDidBeginEditingNotification object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(textViewDidEndEditing:)
													 name:UITextViewTextDidEndEditingNotification object:nil];
	}
	return self;
}

- (void)drawRect:(CGRect)rect {
	// needs work; there should be a white line at the top
	CGContextRef context = UIGraphicsGetCurrentContext();
	NSMutableArray *colors;
	UIColor *color;
	CGGradientRef gradient;
	CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
	CGPoint point;
	CGPoint point2;
	CGFloat locations[2];
	colors = [NSMutableArray arrayWithCapacity:2];
	
	color = [UIColor colorWithRed:0.616f green:0.612f blue:0.655f alpha:1.0f];
	[colors addObject:(id)[color CGColor]];
	locations[0] = 0.0f;
	
	color = [UIColor colorWithRed:0.263f green:0.263f blue:0.29f alpha:1.0f];
	[colors addObject:(id)[color CGColor]];
	locations[1] = 1.0f;
	
	gradient = CGGradientCreateWithColors(space, (CFArrayRef)colors, locations);
	point = self.bounds.origin;
	point2 = CGPointMake(CGRectGetMinX(self.bounds), CGRectGetMaxY(self.bounds));
		
	CGContextDrawLinearGradient(context, gradient, point, point2, (kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation));
	
	CGGradientRelease(gradient);
	CGColorSpaceRelease(space);	
}


#pragma mark -
#pragma mark key management

- (CGRect)frameForKeyTag:(NSInteger)tag {
	CGFloat x = 0, y = 0, w = 0, h = 75.0f;
	if (tag < 11) {
		y = 9.0f;
		w = 80.0f;
		if (tag == 0) {
			x = 6.0f;
		} else if (tag == 1) {
			x = 99.0f;
		} else if (tag == 2) {
			x = 192.0f;
		} else if (tag == 3) {
			x = 285.0f;
		} else if (tag == 4) {
			x = 378.0f;
		} else if (tag == 5) {
			x = 471.0f;
		} else if (tag == 6) {
			x = 564.0f;
		} else if (tag == 7) {
			x = 657.0f;
		} else if (tag == 8) {
			x = 750.0f;
		} else if (tag == 9) {
			x = 843.0f;
		} else if (tag == 10) {
			x = 936.0f;
			w = 81.0f;
		}
	} else if (tag < 21) {
		y = 95.0f;
		w = 79.0f;
		if (tag == 11) {
			x = 44.0f;
		} else if (tag == 12) {
			x = 136.0f;
		} else if (tag == 13) {
			x = 228.0f;
		} else if (tag == 14) {
			x = 320.0f;
		} else if (tag == 15) {
			x = 412.0f;
		} else if (tag == 16) {
			x = 504.0f;
		} else if (tag == 17) {
			x = 596.0f;
		} else if (tag == 18) {
			x = 688.0f;
		} else if (tag == 19) {
			x = 780.0f;
		} else if (tag == 20) {
			x = 872.0f;
			w = 145.0f;
		}
	} else if (tag < 32) {
		y = 181.0f;
		if (tag == 21) {
			x = 6.0f;
			w = 78.0f;
		} else if (tag == 22) {
			x = 97.0f;
			w = 78.0f;
		} else if (tag == 23) {
			x = 188.0f;
			w = 77.0f;
		} else if (tag == 24) {
			x = 278.0f;
			w = 78.0f;
		} else if (tag == 25) {
			x = 369.0f;
			w = 77.0f;
		} else if (tag == 26) {
			x = 459.0f;
			w = 78.0f;
		} else if (tag == 27) {
			x = 550.0f;
			w = 77.0f;
		} else if (tag == 28) {
			x = 640.0f;
			w = 78.0f;
		} else if (tag == 29) {
			x = 731.0f;
			w = 77.0f;
		} else if (tag == 30) {
			x = 821.0f;
			w = 77.0f;
		} else if (tag == 31) {
			x = 911.0f;
			w = 106.0f;
		}
	} else {
		y = 267.0f;
		if (tag == 32) {
			x = 6.0f;
			w = 78.0f;
		} else if (tag == 33) {
			x = 97.0f;
			w = 88.0f;
		} else if (tag == 34) {
			x = 198.0f;
			w = 549.0f;
		} else if (tag == 35) {
			x = 760.0f;
			w = 79.0f;
		} else if (tag == 36) {
			x = 852.0f;
			w = 74.0f;
		} else if (tag == 37) {
			x = 939.0f;
			w = 78.0f;
		}
	}
	return CGRectMake(x, y, w, h);
}

- (void)addKeyWithTag:(NSInteger)tag {
	CGRect frame = [self frameForKeyTag:tag];
	FBKeyView *keyView = [[FBKeyView alloc] initWithFrame:frame];
	keyView.tag = tag;
	[self addSubview:keyView];
	keyView.label = [self stringForTag:tag];
	keyView.labelUp = [self upStringForTag:tag];
	keyView.labelRight = [self rightStringForTag:tag];
	keyView.labelDown = [self downStringForTag:tag];
	keyView.labelLeft = [self leftStringForTag:tag];
		
	switch (tag) {
		case 0:
			keyView.charCenter = 113;
			keyView.charUp = 49;
			keyView.charRight = 124;
			keyView.charDown = 81;
			keyView.charLeft = 0;
			break;
		case 1:
			keyView.charCenter = 119;
			keyView.charUp = 50;
			keyView.charRight = 0;
			keyView.charDown = 87;
			keyView.charLeft = 64;
			break;
		case 2:
			keyView.charCenter = 101;
			keyView.charUp = 51;
			keyView.charRight = 233;
			keyView.charDown = 69;
			keyView.charLeft = 35;
			break;
		case 3:
			keyView.charCenter = 114;
			keyView.charUp = 52;
			keyView.charRight = 0;
			keyView.charDown = 82;
			keyView.charLeft = 36;
			break;
		case 4:
			keyView.charCenter = 116;
			keyView.charUp = 53;
			keyView.charRight = 163;
			keyView.charDown = 84;
			keyView.charLeft = 37;
			break;
		case 5:
			keyView.charCenter = 121;
			keyView.charUp = 54;
			keyView.charRight = 165;
			keyView.charDown = 89;
			keyView.charLeft = 94;
			break;
		case 6:
			keyView.charCenter = 117;
			keyView.charUp = 55;
			keyView.charRight = 8364;
			keyView.charDown = 85;
			keyView.charLeft = 38;
			break;
		case 7:
			keyView.charCenter = 105;
			keyView.charUp = 56;
			keyView.charRight = 238;
			keyView.charDown = 73;
			keyView.charLeft = 42;
			break;
		case 8:
			keyView.charCenter = 111;
			keyView.charUp = 57;
			keyView.charRight = 61;
			keyView.charDown = 79;
			keyView.charLeft = 43;
			break;
		case 9:
			keyView.charCenter = 112;
			keyView.charUp = 48;
			keyView.charRight = 92;
			keyView.charDown = 80;
			keyView.charLeft = 47;
			break;
		case 10:
			keyView.charCenter = 0;
			keyView.charUp = 0;
			keyView.charRight = 0;
			keyView.charDown = 0;
			keyView.charLeft = 0;
			break;
		case 11:
			keyView.charCenter = 97;
			keyView.charUp = 0;
			keyView.charRight = 0;
			keyView.charDown = 65;
			keyView.charLeft = 0;
			break;
		case 12:
			keyView.charCenter = 115;
			keyView.charUp = 0;
			keyView.charRight = 0;
			keyView.charDown = 83;
			keyView.charLeft = 0;
			break;
		case 13:
			keyView.charCenter = 100;
			keyView.charUp = 0;
			keyView.charRight = 0;
			keyView.charDown = 68;
			keyView.charLeft = 0;
			break;
		case 14:
			keyView.charCenter = 102;
			keyView.charUp = 0;
			keyView.charRight = 0;
			keyView.charDown = 70;
			keyView.charLeft = 0;
			break;
		case 15:
			keyView.charCenter = 103;
			keyView.charUp = 0;
			keyView.charRight = 0;
			keyView.charDown = 71;
			keyView.charLeft = 0;
			break;
		case 16:
			keyView.charCenter = 104;
			keyView.charUp = 0;
			keyView.charRight = 0;
			keyView.charDown = 72;
			keyView.charLeft = 0;
			break;
		case 17:
			keyView.charCenter = 106;
			keyView.charUp = 0;
			keyView.charRight = 0;
			keyView.charDown = 74;
			keyView.charLeft = 0;
			break;
		case 18:
			keyView.charCenter = 107;
			keyView.charUp = 0;
			keyView.charRight = 0;
			keyView.charDown = 75;
			keyView.charLeft = 0;
			break;
		case 19:
			keyView.charCenter = 108;
			keyView.charUp = 0;
			keyView.charRight = 76;
			keyView.charDown = 0;
			keyView.charLeft = 0;
			break;
		case 20:
			keyView.charCenter = 0;
			keyView.charUp = 0;
			keyView.charRight = 0;
			keyView.charDown = 0;
			keyView.charLeft = 0;
			break;
		case 21:
			keyView.charCenter = 8217;
			keyView.charUp = 8216;
			keyView.charRight = 8220;
			keyView.charDown = 39;
			keyView.charLeft = 8221;
			break;
		case 22:
			keyView.charCenter = 122;
			keyView.charUp = 0xb4;
			keyView.charRight = 0;
			keyView.charDown = 90;
			keyView.charLeft = 0;
			break;
		case 23:
			keyView.charCenter = 120;
			keyView.charUp = 0x64;
			keyView.charRight = 0;
			keyView.charDown = 88;
			keyView.charLeft = 0;
			break;
		case 24:
			keyView.charCenter = 99;
			keyView.charUp = 0xa8;
			keyView.charRight = 0;
			keyView.charDown = 67;
			keyView.charLeft = 0;
			break;
		case 25:
			keyView.charCenter = 118;
			keyView.charUp = 0x5e;
			keyView.charRight = 0;
			keyView.charDown = 86;
			keyView.charLeft = 0;
			break;
		case 26:
			keyView.charCenter = 98;
			keyView.charUp = 0x7e;
			keyView.charRight = 0;
			keyView.charDown = 66;
			keyView.charLeft = 0;
			break;
		case 27:
			keyView.charCenter = 110;
			keyView.charUp = 241;
			keyView.charRight = 0;
			keyView.charDown = 78;
			keyView.charLeft = 0;
			break;
		case 28:
			keyView.charCenter = 109;
			keyView.charUp = 0x02d8;
			keyView.charRight = 0;
			keyView.charDown = 77;
			keyView.charLeft = 0;
			break;
		case 29:
			keyView.charCenter = 44;
			keyView.charUp = 0;
			keyView.charRight = 0;
			keyView.charDown = 59;
			keyView.charLeft = 0;
			break;
		case 30:
			keyView.charCenter = 46;
			keyView.charUp = 33;
			keyView.charRight = 63;
			keyView.charDown = 58;
			keyView.charLeft = 0;
			break;
		case 31:
			keyView.charCenter = 45;
			keyView.charUp = 0;
			keyView.charRight = 8212;
			keyView.charDown = 95;
			keyView.charLeft = 8211;
			break;
		case 32:
			keyView.charCenter = 0;
			keyView.charUp = 0;
			keyView.charRight = 0;
			keyView.charDown = 0;
			keyView.charLeft = 0;
			// This is the arrow key
			keyView.recognizesUpLeft = YES;
			keyView.recognizesDownRight = YES;
			break;
		case 33:
			keyView.charCenter = 0;
			keyView.charUp = 0;
			keyView.charRight = 0;
			keyView.charDown = 0;
			keyView.charLeft = 0;
			break;
		case 34:
			keyView.charCenter = 32;
			keyView.charUp = 0;
			keyView.charRight = 0;
			keyView.charDown = 0;
			keyView.charLeft = 0;
			break;
		case 35:
			keyView.charCenter = 40;
			keyView.charUp = 91;
			keyView.charRight = 60;
			keyView.charDown = 96;
			keyView.charLeft = 123;
			break;
		case 36:
			keyView.charCenter = 41;
			keyView.charUp = 93;
			keyView.charRight = 62;
			keyView.charDown = 126;
			keyView.charLeft = 125;
			break;
		case 37:
			keyView.charCenter = 0;
			keyView.charUp = 0;
			keyView.charRight = 0;
			keyView.charDown = 0;
			keyView.charLeft = 0;
			break;
			
		default:
			keyView.charCenter = 0;
			keyView.charUp = 0;
			keyView.charRight = 0;
			keyView.charDown = 0;
			keyView.charLeft = 0;
			break;
	}
		
	[keyView release];
}

- (void)addKeys {
	NSUInteger tag;
	for (tag = 0; tag < 38; tag++) {
		[self addKeyWithTag:tag];
	}
}

- (NSString *)stringForTag:(NSInteger)tag {
	switch (tag) {
		case 0:
			return @"q";
		case 1:
			return @"w";
		case 2:
			return @"e";
		case 3:
			return @"r";
		case 4:
			return @"t";
		case 5:
			return @"y";
		case 6:
			return @"u";
		case 7:
			return @"i";
		case 8:
			return @"o";
		case 9:
			return @"p";
		case 10:
			return @"delete";
		case 11:
			return @"a";
		case 12:
			return @"s";
		case 13:
			return @"d";
		case 14:
			return @"f";
		case 15:
			return @"g";
		case 16:
			return @"h";
		case 17:
			return @"j";
		case 18:
			return @"k";
		case 19:
			return @"l";
		case 20:
			return NSLocalizedString(@"return", @"return key label");
		case 21:
			return @"’";
		case 22:
			return @"z";
		case 23:
			return @"x";
		case 24:
			return @"c";
		case 25:
			return @"v";
		case 26:
			return @"b";
		case 27:
			return @"n";
		case 28:
			return @"m";
		case 29:
			return @",";
		case 30:
			return @".";
		case 31:
			return @"-";
		case 32:
			return @"arr";
		case 33:
			return @"select";
		case 34:
			return @" ";
		case 35:
			return @"(";
		case 36:
			return @")";
		case 37:
			return @"hide";
		default:
			return @"";
	}	
}

- (NSString *)upStringForTag:(NSInteger)tag {
	switch (tag) {
		case 0:
			return @"1";
		case 1:
			return @"2";
		case 2:
			return @"3";
		case 3:
			return @"4";
		case 4:
			return @"5";
		case 5:
			return @"6";
		case 6:
			return @"7";
		case 7:
			return @"8";
		case 8:
			return @"9";
		case 9:
			return @"0";
		case 10:
			return @"";
		case 11:
			return @"";
		case 12:
			return @"";
		case 13:
			return @"";
		case 14:
			return @"";
		case 15:
			return @"";
		case 16:
			return @"";
		case 17:
			return @"";
		case 18:
			return @"";
		case 19:
			return @"";
		case 20:
			return @"";
		case 21:
			return @"‘";
		case 22:
			return @"´…";
		case 23:
			return @"`…";
		case 24:
			return @"¨…";
		case 25:
			return @"^…";
		case 26:
			return @"~…";
		case 27:
			return @"ñ";
		case 28:
			return @"˘…";
		case 29:
			return @"";
		case 30:
			return @"!";
		case 31:
			return @"";
		case 32:
			return @"up";
		case 33:
			return @"";
		case 34:
			return @"";
		case 35:
			return @"[";
		case 36:
			return @"]";
		case 37:
			return @"";
		default:
			return @"";
	}	
}

- (NSString *)rightStringForTag:(NSInteger)tag {
	switch (tag) {
		case 0:
			return @"|";
		case 1:
			return @"";
		case 2:
			return @"é";
		case 3:
			return @"";
		case 4:
			return @"£";
		case 5:
			return @"¥";
		case 6:
			return @"€";
		case 7:
			return @"î";
		case 8:
			return @"=";
		case 9:
			return @"\\";
		case 10:
			return @"";
		case 11:
			return @"";
		case 12:
			return @"";
		case 13:
			return @"";
		case 14:
			return @"";
		case 15:
			return @"";
		case 16:
			return @"";
		case 17:
			return @"";
		case 18:
			return @"";
		case 19:
			return @"";
		case 20:
			return @"";
		case 21:
			return @"“";
		case 22:
			return @"";
		case 23:
			return @"";
		case 24:
			return @"";
		case 25:
			return @"";
		case 26:
			return @"";
		case 27:
			return @"";
		case 28:
			return @"";
		case 29:
			return @"";
		case 30:
			return @"?";
		case 31:
			return @"—";
		case 32:
			return @"rt";
		case 33:
			return @"";
		case 34:
			return @"";
		case 35:
			return @"<";
		case 36:
			return @">";
		case 37:
			return @"";
		default:
			return @"";
	}	
}

- (NSString *)downStringForTag:(NSInteger)tag {
	switch (tag) {
		case 0:
			return @"Q";
		case 1:
			return @"W";
		case 2:
			return @"E";
		case 3:
			return @"R";
		case 4:
			return @"T";
		case 5:
			return @"Y";
		case 6:
			return @"U";
		case 7:
			return @"I";
		case 8:
			return @"O";
		case 9:
			return @"P";
		case 10:
			return @"";
		case 11:
			return @"A";
		case 12:
			return @"S";
		case 13:
			return @"D";
		case 14:
			return @"F";
		case 15:
			return @"G";
		case 16:
			return @"H";
		case 17:
			return @"J";
		case 18:
			return @"K";
		case 19:
			return @"L";
		case 20:
			return @"";
		case 21:
			return @"'";
		case 22:
			return @"Z";
		case 23:
			return @"X";
		case 24:
			return @"C";
		case 25:
			return @"V";
		case 26:
			return @"B";
		case 27:
			return @"N";
		case 28:
			return @"M";
		case 29:
			return @";";
		case 30:
			return @":";
		case 31:
			return @"_";
		case 32:
			return @"dn";
		case 33:
			return @"";
		case 34:
			return @"";
		case 35:
			return @"`";
		case 36:
			return @"~";
		case 37:
			return @"";
		default:
			return @"";
	}
}

- (NSString *)leftStringForTag:(NSInteger)tag {
	switch (tag) {
		case 0:
			return @"";
		case 1:
			return @"@";
		case 2:
			return @"#";
		case 3:
			return @"$";
		case 4:
			return @"%";
		case 5:
			return @"^";
		case 6:
			return @"&";
		case 7:
			return @"*";
		case 8:
			return @"+";
		case 9:
			return @"/";
		case 10:
			return @"";
		case 11:
			return @"";
		case 12:
			return @"";
		case 13:
			return @"";
		case 14:
			return @"";
		case 15:
			return @"";
		case 16:
			return @"";
		case 17:
			return @"";
		case 18:
			return @"";
		case 19:
			return @"";
		case 20:
			return @"";
		case 21:
			return @"”";
		case 22:
			return @"";
		case 23:
			return @"";
		case 24:
			return @"";
		case 25:
			return @"";
		case 26:
			return @"";
		case 27:
			return @"";
		case 28:
			return @"";
		case 29:
			return @"";
		case 30:
			return @"";
		case 31:
			return @"–";
		case 32:
			return @"lf";
		case 33:
			return @"";
		case 34:
			return @"";
		case 35:
			return @"{";
		case 36:
			return @"}";
		case 37:
			return @"";
		default:
			return @"";
	}
}


#pragma mark -
#pragma mark methods sent by keys

- (void)keyDidBeginTouch:(FBKeyView *)keyView {
	if (fbSpaceKeyIsDown) {
		// We received a touchDown while spaceKey is down, so set a flag to ignore the spaceKey up.
		fbIgnoreSpaceKeyUp = YES;
	}
	if (keyView.tag == 33) {
		fbSelectKeyIsDown = YES;
	} else if (keyView.tag == 34) {
		fbSpaceKeyIsDown = YES;
	}
}

- (void)key:(FBKeyView *)keyView didEndTouchWithSwipeType:(FBSwipeType)swipeType {
	// Contains an internal return.
	//NSLog(@"key with tag %i sent swipe type %u", keyView.tag, swipeType);
	
	if (keyView.tag == 33) {
		fbSelectKeyIsDown = NO;
		fbIgnoreSpaceKeyUp = YES;
	} else if (keyView.tag == 34) {
		fbSpaceKeyIsDown = NO;
		// I don't like this internal return. Do nothing if this is the space touchUp and the flag was set.
		if (keyView.tag == 34 && fbIgnoreSpaceKeyUp) {
			fbIgnoreSpaceKeyUp = NO;
			return;
		}
	}
	
	// space key works as command key:
	if (fbSpaceKeyIsDown) {
		[self doSpaceCommandForKey:keyView];
	} else {
		unichar charToSend = 0;
		if (swipeType == FBSwipeNone) {
			charToSend = keyView.charCenter;
		} else if (swipeType == FBSwipeUp) {
			charToSend = keyView.charUp;
		} else if (swipeType == FBSwipeRight) {
			charToSend = keyView.charRight;
		} else if (swipeType == FBSwipeDown) {
			charToSend = keyView.charDown;
		} else if (swipeType == FBSwipeLeft) {
			charToSend = keyView.charLeft;
		}
		
		if (charToSend > 0) {
			NSString *str = [NSString stringWithFormat:@"%C", charToSend];
			[[self fbTextView] performSelector:@selector(insertText:) withObject:str];
		} else {
			[self doCommandForKey:keyView swipeType:swipeType];
		}
	}
}

- (void)key:(FBKeyView *)keyView didSendTapCount:(NSUInteger)tapCount {
	//NSLog(@"key with tag %i sent tap count %u", keyView.tag, tapCount);
}


#pragma mark -
#pragma mark commands

- (void)doCommandForKey:(FBKeyView *)key swipeType:(FBSwipeType)swipeType {
	if (key.tag == 20) {		// newline
		[[self fbTextView] performSelector:@selector(insertText:) withObject:@"\n"];
	} else if (key.tag == 10) {	// backspace
		[self backspace];
	} else if (key.tag == 32) {
		if (swipeType == FBSwipeLeft) {
			[self moveLeft];
		} else if (swipeType == FBSwipeRight) {
			[self moveRight];
		} else if (swipeType == FBSwipeUp) {
			[self moveUp];
		} else if (swipeType == FBSwipeDown) {
			[self moveDown];
		} else if (swipeType == FBSwipeUpLeft) {
			[self home];
		} else if (swipeType == FBSwipeDownRight) {
			[self end];
		}
	}
}

- (void)doSpaceCommandForKey:(FBKeyView *)key {
	if (key.tag == 11) {	// select all
		[self.fbTextView selectAll:nil];
	}
}

- (void)backspace {
	NSRange originalRange = self.fbTextView.selectedRange;
	NSString *originalText = self.fbTextView.text;
	NSUInteger originalTextLength = [originalText length];
	//NSLog(@"len is %u, selrange is %@", [originalText length], NSStringFromRange(originalRange));
	
	BOOL selRangeIsAtEnd = NSMaxRange(originalRange) == originalTextLength;
	BOOL isEmptySelection = originalRange.length == 0;
	NSString *newString = nil;
	
	if (isEmptySelection) {
		if (originalRange.location == 0) return;
		
		if (selRangeIsAtEnd) {
			// delete last char:
			newString = [originalText substringToIndex:originalTextLength - 1];
		} else {
			newString = [originalText stringByReplacingCharactersInRange:NSMakeRange(originalRange.location - 1, 1) withString:@""];
		}
	} else {
		newString = [originalText stringByReplacingCharactersInRange:originalRange withString:@""];
	}
	
	NSRange newSelRange = NSMakeRange(0, 0);
	if (originalRange.location > 0) {
		newSelRange.location = originalRange.location - 1;
	}
	self.fbTextView.text = newString;
	self.fbTextView.selectedRange = newSelRange;
}

- (void)moveLeft {
	NSRange selRange = self.fbTextView.selectedRange;
	if (fbSelectKeyIsDown) {
		if (selRange.location > 0) {
			selRange.location--;
			selRange.length++;
		}
	} else {
		if (selRange.length > 0) {
			// There's a selection already, so clear it
			selRange.length = 0;
		} else {
			// move cursor left
			if (selRange.location > 0) {
				selRange.location--;
			}
		}
	}
	self.fbTextView.selectedRange = selRange;
}

- (void)moveRight {
	NSRange selRange = self.fbTextView.selectedRange;
	NSUInteger textLength = self.fbTextView.text.length;
	if (fbSelectKeyIsDown) {
		if (NSMaxRange(selRange) < textLength) {
			selRange.length++;
		}
	} else {
		if (selRange.length > 0) {
			selRange.location = NSMaxRange(selRange);
			selRange.length = 0;
		} else {
			// move cursor right
			if (NSMaxRange(selRange) < textLength) {
				selRange.location++;
			}
		}
	}
	self.fbTextView.selectedRange = selRange;	
}

- (void)moveUp {
	// FIXME DNK how to handle wrapped lines.
	
}
- (void)moveDown {
	// FIXME
}

- (void)home {
	if (fbSelectKeyIsDown) {
		NSUInteger textLength = self.fbTextView.text.length;
		NSRange selRange = self.fbTextView.selectedRange;
		selRange.length = textLength - selRange.location;
		self.fbTextView.selectedRange = selRange;
	} else {
		self.fbTextView.selectedRange = NSMakeRange(0, 0);
	}
}

- (void)end {
	NSUInteger textLength = self.fbTextView.text.length;
	if (fbSelectKeyIsDown) {
		
	} else {
		self.fbTextView.selectedRange = NSMakeRange(textLength, 0);
	}
}



#pragma mark -
#pragma mark notification methods

- (void)textViewDidBeginEditing:(NSNotification *)note {
	if ([[note object] inputView] == self) {
		self.fbTextView = [note object];
	}
}

- (void)textViewDidEndEditing:(NSNotification *)note {
	if ([[note object] inputView] == self) {
		self.fbTextView = nil;
	}
}


#pragma mark -
#pragma mark synthesize

@synthesize fbTextView;

@end


//-------------------------------------------------------
//		FBKeyView
//-------------------------------------------------------

@implementation FBKeyView


#pragma mark -
#pragma mark overrides

- (void)dealloc {
	[super dealloc];
}

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		//[self setOpaque:NO];
		[self resetFirstTouchLocation];
		//self.showsTouchWhenHighlighted = YES;
	}
	return self;
}

- (void)drawRect:(CGRect)dirtyRect {
	// 1. Draw background
	// Lots of code here from Opacity to draw bg:
	
	CGRect imageBounds = CGRectMake(0.0f, 0.0f, self.bounds.size.width, self.bounds.size.height);
	CGRect bounds = [self bounds];
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGFloat alignStroke;
	CGFloat resolution;
	CGFloat stroke;
	CGMutablePathRef path;
	CGPoint point;
	CGPoint controlPoint1;
	CGPoint controlPoint2;
	CGGradientRef gradient;
	NSMutableArray *colors;
	UIColor *color;
	CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
	CGPoint point2;
	CGAffineTransform transform;
	CGMutablePathRef tempPath;
	CGRect pathBounds;
	CGFloat locations[2];
	resolution = 0.5f * (bounds.size.width / imageBounds.size.width + bounds.size.height / imageBounds.size.height);
	
	CGContextSaveGState(context);
	CGContextTranslateCTM(context, bounds.origin.x, bounds.origin.y);
	CGContextScaleCTM(context, (bounds.size.width / imageBounds.size.width), (bounds.size.height / imageBounds.size.height));
	
	// Layer 1
	
	stroke = 1.0f;
	stroke *= resolution;
	if (stroke < 1.0f) {
		stroke = ceilf(stroke);
	} else {
		stroke = roundf(stroke);
	}
	
	// RTC:
	CGFloat xr = bounds.size.width - 6.0f;
	CGFloat yb = bounds.size.height - 3.0f;
	
	stroke /= resolution;
	alignStroke = fmodf(0.5f * stroke * resolution, 1.0f);
	path = CGPathCreateMutable();
	point = CGPointMake(xr - 2.5f, yb + 2.5f); //(75.5f, 77.5f);
	point.x = (roundf(resolution * point.x + alignStroke) - alignStroke) / resolution;
	point.y = (roundf(resolution * point.y + alignStroke) - alignStroke) / resolution;
	CGPathMoveToPoint(path, NULL, point.x, point.y);
	point = CGPointMake(xr + 5.5f, yb - 5.5f); //83.5f, 69.5f);
	point.x = (roundf(resolution * point.x + alignStroke) - alignStroke) / resolution;
	point.y = (roundf(resolution * point.y + alignStroke) - alignStroke) / resolution;
	controlPoint1 = CGPointMake(xr + 2.0f, yb + 2.5f); //79.889f, 77.5f);
	controlPoint2 = CGPointMake(xr + 5.5f, yb - 1.0f); //83.5f, 73.889f);
	CGPathAddCurveToPoint(path, NULL, controlPoint1.x, controlPoint1.y, controlPoint2.x, controlPoint2.y, point.x, point.y);
	point = CGPointMake(xr + 5.5f, 8.5f); //83.5f, 8.5f);
	point.x = (roundf(resolution * point.x + alignStroke) - alignStroke) / resolution;
	point.y = (roundf(resolution * point.y + alignStroke) - alignStroke) / resolution;
	CGPathAddLineToPoint(path, NULL, point.x, point.y);
	point = CGPointMake(xr - 2.5f, 0.5f); //75.5f, 0.5f);
	point.x = (roundf(resolution * point.x + alignStroke) - alignStroke) / resolution;
	point.y = (roundf(resolution * point.y + alignStroke) - alignStroke) / resolution;
	controlPoint1 = CGPointMake(xr + 5.5f, 4.0f); //83.5f, 4.111f);
	controlPoint2 = CGPointMake(xr + 2.0f, 0.5f); //79.889f, 0.5f);
	CGPathAddCurveToPoint(path, NULL, controlPoint1.x, controlPoint1.y, controlPoint2.x, controlPoint2.y, point.x, point.y);
	point = CGPointMake(8.5f, 0.5f);
	point.x = (roundf(resolution * point.x + alignStroke) - alignStroke) / resolution;
	point.y = (roundf(resolution * point.y + alignStroke) - alignStroke) / resolution;
	CGPathAddLineToPoint(path, NULL, point.x, point.y);
	point = CGPointMake(0.5f, 8.5f);
	point.x = (roundf(resolution * point.x + alignStroke) - alignStroke) / resolution;
	point.y = (roundf(resolution * point.y + alignStroke) - alignStroke) / resolution;
	controlPoint1 = CGPointMake(4.111f, 0.5f);
	controlPoint2 = CGPointMake(0.5f, 4.111f);
	CGPathAddCurveToPoint(path, NULL, controlPoint1.x, controlPoint1.y, controlPoint2.x, controlPoint2.y, point.x, point.y);
	point = CGPointMake(0.5f, yb - 5.5f); //0.5f, 69.5f);
	point.x = (roundf(resolution * point.x + alignStroke) - alignStroke) / resolution;
	point.y = (roundf(resolution * point.y + alignStroke) - alignStroke) / resolution;
	CGPathAddLineToPoint(path, NULL, point.x, point.y);
	point = CGPointMake(8.5f, yb + 2.5f); //8.5f, 77.5f);
	point.x = (roundf(resolution * point.x + alignStroke) - alignStroke) / resolution;
	point.y = (roundf(resolution * point.y + alignStroke) - alignStroke) / resolution;
	controlPoint1 = CGPointMake(0.5f, yb - 1.0f); //0.5f, 73.889f);
	controlPoint2 = CGPointMake(4.111f, yb + 2.5f); //4.111f, 77.5f);
	CGPathAddCurveToPoint(path, NULL, controlPoint1.x, controlPoint1.y, controlPoint2.x, controlPoint2.y, point.x, point.y);
	point = CGPointMake(xr - 2.5f, yb + 2.5f); //75.5f, 77.5f);
	point.x = (roundf(resolution * point.x + alignStroke) - alignStroke) / resolution;
	point.y = (roundf(resolution * point.y + alignStroke) - alignStroke) / resolution;
	CGPathAddLineToPoint(path, NULL, point.x, point.y);
	CGPathCloseSubpath(path);
	colors = [NSMutableArray arrayWithCapacity:2];
	color = [UIColor colorWithRed:0.741f green:0.741f blue:0.761f alpha:1.0f];
	[colors addObject:(id)[color CGColor]];
	locations[0] = 0.0f;
	color = [UIColor colorWithRed:0.886f green:0.886f blue:0.894f alpha:1.0f];
	[colors addObject:(id)[color CGColor]];
	locations[1] = 1.0f;
	gradient = CGGradientCreateWithColors(space, (CFArrayRef)colors, locations);
	CGContextAddPath(context, path);
	CGContextSaveGState(context);
	CGContextEOClip(context);
	transform = CGAffineTransformMakeRotation(1.571f);
	tempPath = CGPathCreateMutable();
	CGPathAddPath(tempPath, &transform, path);
	//pathBounds = CGPathGetPathBoundingBox(tempPath); ios 4.0
	pathBounds = CGPathGetBoundingBox(tempPath);
	point = pathBounds.origin;
	point2 = CGPointMake(CGRectGetMaxX(pathBounds), CGRectGetMinY(pathBounds));
	transform = CGAffineTransformInvert(transform);
	point = CGPointApplyAffineTransform(point, transform);
	point2 = CGPointApplyAffineTransform(point2, transform);
	CGPathRelease(tempPath);
	CGContextDrawLinearGradient(context, gradient, point, point2, (kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation));
	CGContextRestoreGState(context);
	CGGradientRelease(gradient);
	color = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f];
	[color setStroke];
	CGContextSetLineWidth(context, stroke);
	CGContextSetLineCap(context, kCGLineCapSquare);
	CGContextAddPath(context, path);
	CGContextStrokePath(context);
	CGPathRelease(path);
	
	CGContextRestoreGState(context);
	CGColorSpaceRelease(space);
	
	// 2. draw the labels:
	
	if (self.tag == 10) {
		[self drawBackspaceLabel];
	} else if (self.tag == 20) {
		[self drawReturnLabel];
	} else if (self.tag == 32) {
		[self drawArrowsLabel];
	} else if (self.tag == 33) {
		[self drawSelectLabel];
	} else if (self.tag == 34) {
		[self drawSpacebarLabel];
	} else if (self.tag == 37) {
		[self drawHideLabel];
	} else {
		[self drawLabelGlyphs];
	}
}



#pragma mark -
#pragma mark touches

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	fbFirstTouchLocation = [touch locationInView:self];
	[(Flickeyboard *)[self superview] keyDidBeginTouch:self];
}

#define MINMOVEAMOUNT 30.0f
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	CGPoint touchLocation = [touch locationInView:self];
	CGFloat deltaX = touchLocation.x - fbFirstTouchLocation.x;
	CGFloat deltaY = touchLocation.y - fbFirstTouchLocation.y;
	FBSwipeType swipeType = [self swipeTypeForDeltaX:deltaX deltaY:deltaY];
	[(Flickeyboard *)[self superview] key:self didEndTouchWithSwipeType:swipeType];
	NSUInteger tapCount = [touch tapCount];
	if (tapCount > 0) {
		//NSLog(@"You tapped %i times", tapCount);
		[(Flickeyboard *)[self superview] key:self didSendTapCount:tapCount];
	}
}


#pragma mark -
#pragma mark utility methods

- (FBSwipeType)swipeTypeForDeltaX:(CGFloat)deltaX deltaY:(CGFloat)deltaY {
	FBSwipeType swipeType = FBSwipeNone;
	CGFloat absDeltaX = fabsf(deltaX);
	CGFloat absDeltaY = fabsf(deltaY);
	BOOL isSwipe = absDeltaX > MINMOVEAMOUNT || absDeltaY > MINMOVEAMOUNT;
	
	if (isSwipe) {
		if (self.recognizesUpLeft) {
			if (deltaX < 0 && deltaY < 0) {
				CGFloat ratio = absDeltaX/absDeltaY;
				if (ratio > 0.5 && ratio < 2.0) {
					swipeType = FBSwipeUpLeft;
					//NSLog(@"You swiped up left. Ratio was %f", ratio);
				}
			}
		}
		
		if (self.recognizesDownRight) {
			if (deltaX > 0 && deltaY > 0) {
				CGFloat ratio = absDeltaX/absDeltaY;
				if (ratio > 0.5 && ratio < 2.0) {
					swipeType = FBSwipeUpLeft;
					//NSLog(@"You swiped down right. Ratio was %f", ratio);
				}
			}
		}
		
		if (swipeType == FBSwipeNone) {	// i.e., if it's not UL or DR
			BOOL isX = absDeltaX > absDeltaY;
			
			if (isX) {
				if (deltaX > 0) {
					//NSLog(@"You swiped right");
					swipeType = FBSwipeRight;
				} else {
					//NSLog(@"You swiped left");
					swipeType = FBSwipeLeft;
				}
			} else {
				if (deltaY > 0) {
					//NSLog(@"You swiped down");
					swipeType = FBSwipeDown;
				} else {
					//NSLog(@"You swiped up");
					swipeType = FBSwipeUp;
				}
			}
		}
	}
	return swipeType;
}

- (void)resetFirstTouchLocation {
	fbFirstTouchLocation = self.frame.origin;
}

- (void)drawLabelGlyphs {
	if (self.label.length > 0) {
		[[UIColor blackColor] set];
		
		UIFont *font = [UIFont systemFontOfSize:26.0f];
		CGSize labelSize = [self.label sizeWithFont:font];
		CGPoint labelPoint = CGPointMake(CGRectGetMidX(self.bounds) - labelSize.width / 2.0f, CGRectGetMidY(self.bounds) - labelSize.height / 2.0f);
		labelPoint.x = floorf(labelPoint.x) + 0.5;
		labelPoint.y = floorf(labelPoint.y) + 0.5;
		[self.label drawAtPoint:labelPoint withFont:font];
	}
	
	[[UIColor colorWithWhite:0.5f alpha:1.0] set];
	UIFont *font = [UIFont systemFontOfSize:15.0f];
	
	if (self.labelUp.length > 0) {
		CGSize labelSize = [self.labelUp sizeWithFont:font];
		CGPoint labelPoint = CGPointMake(CGRectGetMidX(self.bounds) - labelSize.width / 2.0f, 1.0f);
		[self.labelUp drawAtPoint:labelPoint withFont:font];
	}
	
	if (self.labelRight.length > 0) {
		CGSize labelSize = [self.labelRight sizeWithFont:font];
		CGPoint labelPoint = CGPointMake(CGRectGetMaxX(self.bounds) - (labelSize.width + 10.0f), CGRectGetMidY(self.bounds) - labelSize.height / 2.0f + 3.0f);
		[self.labelRight drawAtPoint:labelPoint withFont:font];
	}
	
	if (self.labelDown.length > 0) {
		CGSize labelSize = [self.labelDown sizeWithFont:font];
		CGPoint labelPoint = CGPointMake(CGRectGetMidX(self.bounds) - labelSize.width / 2.0f, CGRectGetMaxY(self.bounds) - (labelSize.height + 1.0f));
		[self.labelDown drawAtPoint:labelPoint withFont:font];
	}
	
	if (self.labelLeft.length > 0) {
		CGSize labelSize = [self.labelLeft sizeWithFont:font];
		CGPoint labelPoint = CGPointMake(10.0f, CGRectGetMidY(self.bounds) - labelSize.height / 2.0f + 3.0f);
		[self.labelLeft drawAtPoint:labelPoint withFont:font];
	}	
}

- (void)drawBackspaceLabel {
	// FIXME
	[self drawLabelGlyphs];
}

- (void)drawReturnLabel {
	// FIXME
	[self drawLabelGlyphs];
}

- (void)drawArrowsLabel {
	CGFloat arrowSize = 4.0f;
	CGFloat lineLength = 18.5f;
	UIBezierPath *bp = [UIBezierPath bezierPath];
	[bp moveToPoint:CGPointMake(0.5, 5.5f)];
	[bp addLineToPoint:CGPointMake(lineLength, 5.5f)];
	[bp addLineToPoint:CGPointMake(lineLength - arrowSize, 5.5 - (arrowSize / 2.0f))];
	[bp addLineToPoint:CGPointMake(lineLength - arrowSize, 5.5f + (arrowSize / 2.0f))];
	[bp addLineToPoint:CGPointMake(lineLength, 5.5f)];
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	[[UIColor blackColor] setStroke];
	[[UIColor blackColor] setFill];
	
	
	// left arrow:
	CGContextSaveGState(context);
	CGContextTranslateCTM(context, 25.0f, 45.0f);
	CGContextRotateCTM(context, 180 * M_PI / 180);
	[bp fill];
	[bp stroke];
	CGContextRestoreGState(context);
	
	// right arrow:
	CGContextSaveGState(context);
	CGContextTranslateCTM(context, 54.0f, 35.0f);
	//CGContextRotateCTM(context, 180 * M_PI / 180);
	[bp fill];
	[bp stroke];
	CGContextRestoreGState(context);
	
	// up arrow:
	CGContextSaveGState(context);
	CGContextTranslateCTM(context, 35.0f, 25.0f);
	CGContextRotateCTM(context, -90 * M_PI / 180);
	[bp fill];
	[bp stroke];
	CGContextRestoreGState(context);
	
	// down arrow:
	CGContextSaveGState(context);
	CGContextTranslateCTM(context, 45.0f, 50.0f);
	CGContextRotateCTM(context, 90 * M_PI / 180);
	[bp fill];
	[bp stroke];
	CGContextRestoreGState(context);

	// up left arrow:
	CGContextSaveGState(context);
	CGContextTranslateCTM(context, 20.0f, 25.0f);
	CGContextRotateCTM(context, 225 * M_PI / 180);
	[bp fill];
	[bp stroke];
	CGContextRestoreGState(context);
	
	// down right arrow:
	CGContextSaveGState(context);
	CGContextTranslateCTM(context, 58.0f, 50.0f);
	CGContextRotateCTM(context, 45 * M_PI / 180);
	[bp fill];
	[bp stroke];
	CGContextRestoreGState(context);
}

- (void)drawSelectLabel {
	UIBezierPath *bp = [UIBezierPath bezierPathWithRect:CGRectMake(8.0f, 14.0f, 37.0f, 45.0f)];
	[[UIColor colorWithWhite:0.4f alpha:1.0f] setFill];
	[bp fill];
	[self drawLabelGlyphs];
}

- (void)drawSpacebarLabel {
	// FIXME
	[self drawLabelGlyphs];
}

- (void)drawHideLabel {
	// FIXME
	[self drawLabelGlyphs];
}


#pragma mark -
#pragma mark synthesize 

@synthesize label = fbLabel, labelUp = fbLabelUp, labelRight = fbLabelRight;
@synthesize labelDown = fbLabelDown, labelLeft = fbLabelLeft;
@synthesize charCenter, charUp, charDown, charRight, charLeft;
@synthesize recognizesUpLeft, recognizesDownRight;

@end
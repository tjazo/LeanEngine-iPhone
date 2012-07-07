/*
 * This software is released under the GNU Lesser General Public License v3.
 * For more information see http://www.gnu.org/licenses/lgpl.html
 *
 * Copyright (c) 2011, Peter Knego & Matjaz Tercelj
 * All rights reserved.
 */

#import "LEText.h"

@implementation LEText {
    NSString *value;
}

@synthesize value;

- (id)initWithString:(NSString *)value {
    self = [self init];
    if (self) {
        self.value = value;
    }
    return self;
}

- (void)dealloc {
    [value release];
    [super dealloc];
}

@end

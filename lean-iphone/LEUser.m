/*
 * This software is released under the GNU Lesser General Public License v3.
 * For more information see http://www.gnu.org/licenses/lgpl.html
 *
 * Copyright (c) 2011, Peter Knego & Matjaz Tercelj
 * All rights reserved.
 */
#import "LEUser.h"

@implementation LEUser

- (id)init {
    self = [super init];
    if (self) {
        // Initialization code here.
    }

    return self;
}

- (void)loginFacebookInBrowser {
    NSURL *url = [NSURL URLWithString:@"http://www.iphonedevelopertips.com"];
    [[UIApplication sharedApplication] openURL:url];

}

@end

/*
 * This software is released under the GNU Lesser General Public License v3.
 * For more information see http://www.gnu.org/licenses/lgpl.html
 *
 * Copyright (c) 2011, Peter Knego & Matjaz Tercelj
 * All rights reserved.
 */

#import "LEManager.h"

static LEManager *instance = nil;

@implementation LEManager


@synthesize hostURL;
@synthesize token;

- (id)init {
    self = [super init];
    if (self) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *savedToken = [defaults stringForKey:@"token"];
        NSLog(@"Loading saved token: %@", savedToken);
        if (savedToken) {
            self.token = savedToken;
        }
    }
    return self;
}

- (id)initWithHostURL:(NSString *)hostURL {
    self = [self init];
    if (self) {
        self.hostURL = hostURL;
    }
    return self;
}

+ (LEManager *)managerWithHostURL:(NSString *)hostURL {
    if (instance == nil) {
        instance = [[LEManager alloc] initWithHostURL:hostURL];
    }
    NSLog(@"LEManager initialized");

    return instance;
}

- (void)loginWithFacebookDialog {
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
            @"mobile", @"type",
            nil];

    NSMutableString *urlString = [[NSMutableString alloc] initWithString:hostURL];
    [urlString appendString:@"/facebook"];

    FBDialog *dialog = [[FBLoginDialog alloc] initWithURL:urlString
                                              loginParams:params
                                                 delegate:self];
    [dialog show];
}

- (void)loginWithGoogleDialog {
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
            @"mobile", @"type",
            @"google", @"provider",
            nil];

    NSMutableString *urlString = [[NSMutableString alloc] initWithString:hostURL];
    [urlString appendString:@"/openid"];

    FBDialog *dialog = [[FBLoginDialog alloc] initWithURL:urlString
                                              loginParams:params
                                                 delegate:self];
    [dialog show];
}

- (void)loginWithYahooDialog {
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
            @"mobile", @"type",
            @"yahoo", @"provider",
            nil];

    NSMutableString *urlString = [[NSMutableString alloc] initWithString:hostURL];
    [urlString appendString:@"/openid"];

    FBDialog *dialog = [[FBLoginDialog alloc] initWithURL:urlString
                                              loginParams:params
                                                 delegate:self];
    [dialog show];
}


- (BOOL)isLoggedIn {
    return self.token != nil;
}

- (void)setAndSave:(NSString *)token {
    self.token = token;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:token forKey:@"token"];
    [defaults synchronize];
    NSLog(@"Saving token");
}

+ (LEManager *)getInstance {
    if (instance == nil) {
        [NSException raise:NSInvalidArgumentException format:@"Lean Engine instance is nil. LEManager must be initialized before you can use it"];
    }
    return instance;
}

- (void)logOut {
    self.token = nil;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"token"];
    [defaults synchronize];
}

- (void)dealloc {
    [hostURL release];
    [token release];
    [super dealloc];
}


#pragma mark - FBDialogDelegate Methods

/**
 * Called when a UIServer Dialog successfully return.
 */
- (void)dialogDidComplete:(FBDialog *)dialog {
    NSLog(@"Dialog did complete.");

//    switch (currentAPICall) {
//        case kDialogFeedUser:
//        case kDialogFeedFriend:
//        {
//            [self showMessage:@"Published feed successfully."];
//            break;
//        }
//        default:
//            break;
//    }
}

- (void)dialogDidNotComplete:(FBDialog *)dialog {
    NSLog(@"Dialog dismissed.");
}

- (void)dialog:(FBDialog *)dialog didFailWithError:(NSError *)error {
    NSLog(@"Error message: %@", [[error userInfo] objectForKey:@"error_msg"]);
}


#pragma mark - FBLoginDialogDelegate methods

/**
 * Set the authToken and expirationDate after login succeed
 */
- (void)fbDialogLogin:(NSString *)token expirationDate:(NSDate *)expirationDate {
    NSLog(token);
    [self setAndSave:token];
//  self.expirationDate = expirationDate;
//  if ([self.sessionDelegate respondsToSelector:@selector(fbDidLogin)]) {
//    [_sessionDelegate fbDidLogin];
//  }

}

/**
 * Did not login call the not login delegate
 */
- (void)fbDialogNotLogin:(BOOL)cancelled {
    NSLog(@"CANCELLED");
//  if ([self.sessionDelegate respondsToSelector:@selector(fbDidNotLogin:)]) {
//    [_sessionDelegate fbDidNotLogin:cancelled];
//  }
}


@end

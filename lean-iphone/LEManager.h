/*
 * This software is released under the GNU Lesser General Public License v3.
 * For more information see http://www.gnu.org/licenses/lgpl.html
 *
 * Copyright (c) 2011, Peter Knego & Matjaz Tercelj
 * All rights reserved.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FBLoginDialog.h"


@interface LEManager : NSObject <FBLoginDialogDelegate, FBDialogDelegate> {
    NSString *hostURL;
    NSString *token;
}
@property(nonatomic, retain) NSString *hostURL;
@property(nonatomic, retain) NSString *token;

- (id)initWithHostURL:(NSString *)hostURL;

+ (LEManager *)managerWithHostURL:(NSString *)hostURL;

- (void)loginFacebookInBrowser;

- (IBAction)showLoginModal;

- (void)loginFacebookModal:(UIViewController *)viewController;

- (void)loginWithFacebookDialog;

- (void)loginWithGoogleDialog;

- (void)loginWithYahooDialog;

- (BOOL)isLoggedIn;

- (BOOL)handleLogin:(NSURL *)url;

+ (LEManager *)getInstance;

- (void)logOut;


- (void)setAndPersistTokenFrom:(NSURL *)url;

@end

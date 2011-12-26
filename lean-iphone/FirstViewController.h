/*
 * This software is released under the GNU Lesser General Public License v3.
 * For more information see http://www.gnu.org/licenses/lgpl.html
 *
 * Copyright (c) 2011, Peter Knego & Matjaz Tercelj
 * All rights reserved.
 */

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController {
    IBOutlet UIButton *loginButton;
    IBOutlet UIButton *logoutButton;
}

@property(nonatomic, retain) UIButton *loginButton;
@property(nonatomic, retain) UIButton *logoutButton;

- (IBAction)facebookLogin;

- (IBAction)googleLogin;

- (IBAction)yahooLogin;

- (IBAction)logOut;

@end

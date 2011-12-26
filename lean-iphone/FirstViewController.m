/*
 * This software is released under the GNU Lesser General Public License v3.
 * For more information see http://www.gnu.org/licenses/lgpl.html
 *
 * Copyright (c) 2011, Peter Knego & Matjaz Tercelj
 * All rights reserved.
 */

#import "FirstViewController.h"
#import "LEManager.h"

@implementation FirstViewController


@synthesize loginButton;
@synthesize logoutButton;

- (void)showOrHideButtons {
    LEManager *manager = [LEManager getInstance];
    [loginButton setHidden:[manager isLoggedIn]];
    [logoutButton setHidden:![manager isLoggedIn]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showOrHideButtons];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)facebookLogin {
    [[LEManager getInstance] loginWithFacebookDialog];
}

- (IBAction)googleLogin {
    [[LEManager getInstance] loginWithGoogleDialog];
}

- (IBAction)yahooLogin {
    [[LEManager getInstance] loginWithYahooDialog];
}

- (IBAction)logOut {
    [[LEManager getInstance] logOut];
    [self showOrHideButtons];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)dealloc {
    [loginButton release];
    [logoutButton release];
    [super dealloc];
}

@end

/*
 * This software is released under the GNU Lesser General Public License v3.
 * For more information see http://www.gnu.org/licenses/lgpl.html
 *
 * Copyright (c) 2011, Peter Knego & Matjaz Tercelj
 * All rights reserved.
 */

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UITableView *tableView;

    NSArray *entities;
}
@property(nonatomic, retain) UITableView *tableView;

- (IBAction)downloadData;

@end

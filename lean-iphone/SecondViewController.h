/*
 * This software is released under the GNU Lesser General Public License v3.
 * For more information see http://www.gnu.org/licenses/lgpl.html
 *
 * Copyright (c) 2011, Peter Knego & Matjaz Tercelj
 * All rights reserved.
 */

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController {
    IBOutlet UITextField *nameText;
    IBOutlet UITextField *key1Text;
    IBOutlet UITextField *value1Text;
    IBOutlet UITextField *key2Text;
    IBOutlet UITextField *value2Text;
    IBOutlet UITextField *key3Text;
    IBOutlet UITextField *value3Text;

}


@property(nonatomic, retain) UITextField *nameText;
@property(nonatomic, retain) UITextField *key1Text;
@property(nonatomic, retain) UITextField *value1Text;
@property(nonatomic, retain) UITextField *key2Text;
@property(nonatomic, retain) UITextField *value2Text;
@property(nonatomic, retain) UITextField *key3Text;
@property(nonatomic, retain) UITextField *value3Text;


- (IBAction)saveAction;

- (IBAction)textFieldReturn:(id)sender;

- (IBAction)backgroundTouched:(id)sender;

@end

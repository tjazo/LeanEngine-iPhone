/*
 * This software is released under the GNU Lesser General Public License v3.
 * For more information see http://www.gnu.org/licenses/lgpl.html
 *
 * Copyright (c) 2011, Peter Knego & Matjaz Tercelj
 * All rights reserved.
 */

#import "SecondViewController.h"
#import "LERestService.h"
#import "LEEntity.h"

@implementation SecondViewController

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

@synthesize nameText;
@synthesize key1Text;
@synthesize value1Text;
@synthesize key2Text;
@synthesize value2Text;
@synthesize key3Text;
@synthesize value3Text;


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc. that aren't in use.
}

- (IBAction)saveAction {
    LEEntity *entity = [LEEntity new];
    entity.kind = nameText.text;
    NSDictionary *entityProperties = [[NSDictionary alloc] initWithObjectsAndKeys:
            value1Text.text, key1Text.text,
            value2Text.text, key2Text.text,
            value3Text.text, key3Text.text,
            nil];
    entity.properties = entityProperties;


    LERestService *restService = [LERestService new];

    [restService putPrivateEntityAsync:entity];
    [entityProperties release];
    [entity release];
    [restService release];
}

- (void)viewDidUnload {
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (IBAction)textFieldReturn:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)backgroundTouched:(id)sender {
    [sender resignFirstResponder];
}

- (void)dealloc {
    [nameText release];
    [key1Text release];
    [value1Text release];
    [key2Text release];
    [value2Text release];
    [key3Text release];
    [value3Text release];
    [super dealloc];
}


@end

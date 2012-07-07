/*
 * This software is released under the GNU Lesser General Public License v3.
 * For more information see http://www.gnu.org/licenses/lgpl.html
 *
 * Copyright (c) 2011, Peter Knego & Matjaz Tercelj
 * All rights reserved.
 */

#import "ThirdViewController.h"
#import "LERestService.h"
#import "LEEntity.h"

@implementation ThirdViewController

@synthesize tableView;

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*- (void)viewDidLoad
{
    [super viewDidLoad];    
    // Do any additional setup after loading the view from its nib.
}
*/

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (IBAction)downloadData {
    LERestService *restService = [LERestService new];
    entities = [[NSArray alloc] initWithArray:[restService getPrivateEntities:nil]];
    NSLog(@"We got: %i entities", entities.count);
    [tableView reloadData];
//    [restService release];
}

#pragma mark Table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return entities.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Entities";
}

//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
//    return @"www.lean-engine.com";
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    //create a cell
    UITableViewCell *cell = [[UITableViewCell alloc]
            initWithStyle:UITableViewCellStyleSubtitle
          reuseIdentifier:@"cell"];
    //fill a cell
    LEEntity *entity = ((LEEntity *) [entities objectAtIndex:indexPath.row]);
    cell.textLabel.text = entity.kind;
    cell.detailTextLabel.text = [self getEntityPropertiesString:entity];
    return cell;
}

- (NSString *)getEntityPropertiesString:(LEEntity *)entity {
    NSMutableString *sb = [NSMutableString new];
    for (id key in [entity.properties allKeys]) {
        NSLog(@"We got: %@ ", key);

        if (sb.length != 0) {
            [sb appendString:@" | "];
        }
        [sb appendString:key];
        [sb appendString:@": "];
        [sb appendString:[entity.properties objectForKey:key]];
    }
    return sb;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [tableView release];
    [entities release];
    [super dealloc];
}

@end

/*
 * This software is released under the GNU Lesser General Public License v3.
 * For more information see http://www.gnu.org/licenses/lgpl.html
 *
 * Copyright (c) 2011, Peter Knego & Matjaz Tercelj
 * All rights reserved.
 */

#import "LEQuery.h"
#import "LEEntity.h"
#import "LERestService.h"

@implementation LEQuery
@synthesize kind;


- (id)init {
    self = [super init];
    if (self) {

    }
    return self;
}

- (id)initWithKind:(NSString *)kind {
    self = [self init];
    if (self) {
        self.kind = kind;
    }
    return self;
}

+ (NSArray *)fetch {
    LERestService *restService = [LERestService new];
    return [[NSArray alloc] initWithArray:[restService getPrivateEntities:NULL]];
}

- (void)dealloc {
    [kind release];
    [super dealloc];
}


@end

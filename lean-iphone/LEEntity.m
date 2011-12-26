/*
 * This software is released under the GNU Lesser General Public License v3.
 * For more information see http://www.gnu.org/licenses/lgpl.html
 *
 * Copyright (c) 2011, Peter Knego & Matjaz Tercelj
 * All rights reserved.
 */


#import "LEEntity.h"


@implementation LEEntity
@synthesize kind;
@synthesize entityId;
@synthesize accountId;
@synthesize properties;


- (void)dealloc {
    [kind release];
    [properties release];
    [super dealloc];
}

- (NSDictionary *)getEntityData {
    NSMutableDictionary *entityData = [[NSMutableDictionary alloc] initWithDictionary:properties];
    if (entityId) {
        [entityData setObject:entityId forKey:@"_id"];
        [entityData setObject:accountId forKey:@"_account"];
    }
    [entityData setObject:kind forKey:@"_kind"];
    return entityData;
}

@end
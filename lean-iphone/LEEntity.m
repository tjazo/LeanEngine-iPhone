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

- (id)initWithKind:(NSString *)kind {
    self = [self init];
    if (self) {
        self.kind = kind;
    }
    return self;
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

- (NSString *)getStringFor:(NSString *)key {
    id o = [properties objectForKey:key];
    if (o != nil && [o class] == [NSString class]) {
        return o;
    } else {
        return nil;
    }
}

- (NSString *)getTextFor:(NSString *)key {
    id o = [properties objectForKey:key];
//    if (o != nil && [o class] == [LEText class]) {
//        return o;
//    } else {
//        return nil;
//    }
}

- (NSNumber *)getLongFor:(NSString *)key {
    id o = [properties objectForKey:key];
    if (o != nil && strcmp([o objCType], @encode(long)) == 0) {
        return o;
    }
    return nil;
}

- (NSNumber *)getDoubleFor:(NSString *)key {
    id o = [properties objectForKey:key];
    if (o != nil && strcmp([o objCType], @encode(double)) == 0) {
        return o;
    }
    return nil;
}

- (NSDate *)getDateFor:(NSString *)key {
    id o = [properties objectForKey:key];
    if (o != nil && [o class] == [NSDate class]) {
        return o;
    } else {
        return nil;
    }
}

- (NSNumber *)getBooleanFor:(NSString *)key {
    id o = [properties objectForKey:key];
    if (o != nil && strcmp([o objCType], @encode(BOOL)) == 0) {
        return o;
    }
    return nil;
}


@end
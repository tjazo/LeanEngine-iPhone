/*
 * This software is released under the GNU Lesser General Public License v3.
 * For more information see http://www.gnu.org/licenses/lgpl.html
 *
 * Copyright (c) 2011, Peter Knego & Matjaz Tercelj
 * All rights reserved.
 */

#import <Foundation/Foundation.h>


@interface LEEntity : NSObject {
    NSString *kind;
    long entityId;
    long accountId;
    NSDictionary *properties;
}

@property(nonatomic, retain) NSString *kind;
@property(nonatomic) long entityId;
@property(nonatomic) long accountId;
@property(nonatomic, retain) NSDictionary *properties;

- (id)initWithKind:(NSString *)kind;

- (NSDictionary *)getEntityData;

- (NSString *)getStringFor:(NSString *)key;

- (NSString *)getTextFor:(NSString *)key;

- (NSNumber *)getLongFor:(NSString *)key;

- (NSNumber *)getDoubleFor:(NSString *)key;

- (NSDate *)getDateFor:(NSString *)key;

- (NSNumber *)getBooleanFor:(NSString *)key;

@end
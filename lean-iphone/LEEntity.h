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

- (NSDictionary *)getEntityData;

@end
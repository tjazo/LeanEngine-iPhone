/*
 * This software is released under the GNU Lesser General Public License v3.
 * For more information see http://www.gnu.org/licenses/lgpl.html
 *
 * Copyright (c) 2011, Peter Knego & Matjaz Tercelj
 * All rights reserved.
 */


#import <Foundation/Foundation.h>

@class LEEntity;


@interface LERestService : NSObject {


}

- (NSArray *)getPrivateEntitiesAsync;

- (void)putPrivateEntityAsync:(LEEntity *)entity;

@end
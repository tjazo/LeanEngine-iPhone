/*
 * This software is released under the GNU Lesser General Public License v3.
 * For more information see http://www.gnu.org/licenses/lgpl.html
 *
 * Copyright (c) 2011, Peter Knego & Matjaz Tercelj
 * All rights reserved.
 */

#import <Foundation/Foundation.h>

@interface LEText : NSObject
@property(nonatomic, copy) NSString *value;

- (id)initWithString:(NSString *)value;

@end

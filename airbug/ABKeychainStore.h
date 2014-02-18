//
//  ABKeychainStore.h
//  airbug
//
//  Created by Richard Shin on 2/17/14.
//  Copyright (c) 2014 airbug. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABKeychainStore : NSObject

- (NSString *)stringForKey:(NSString *)key;
- (void)setString:(NSString *)aString forKey:(NSString *)aKey;

@end

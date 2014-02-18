//
//  ABKeychainStore.m
//  airbug
//
//  Created by Richard Shin on 2/17/14.
//  Copyright (c) 2014 airbug. All rights reserved.
//

#import "ABKeychainStore.h"
#import "UICKeyChainStore.h"

@implementation ABKeychainStore

- (NSString *)stringForKey:(NSString *)key
{
    return [UICKeyChainStore stringForKey:key];
}

- (void)setString:(NSString *)aString forKey:(NSString *)aKey
{
    [UICKeyChainStore setString:aString forKey:aKey];
}

@end

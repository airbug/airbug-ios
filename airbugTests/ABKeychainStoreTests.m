//
//  ABKeychainStoreTests.m
//  airbug
//
//  Created by Richard Shin on 2/17/14.
//  Copyright (c) 2014 airbug. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ABKeychainStore.h"

@interface ABKeychainStoreTests : XCTestCase
{
    ABKeychainStore *keychainStore;
}
@end

@implementation ABKeychainStoreTests

- (void)testStringForKeyWhenCalledWithNonexistentKeyReturnsNil
{
    keychainStore = [[ABKeychainStore alloc] init];
    
    NSString *aString = [keychainStore stringForKey:@"nonexistent key"];
    
    XCTAssertNil(aString);
}

- (void)testKeychainStoreStoresAndRetrievesStrings
{
    keychainStore = [[ABKeychainStore alloc] init];
    NSString *expectedString = @"expected string";
    NSString *key = @"key";
    [keychainStore setString:expectedString forKey:key];
    
    NSString *actualString = [keychainStore stringForKey:key];
    
    XCTAssertEqualObjects(expectedString, actualString);
}

- (void)testSetStringForKeyWhenKeyAlreadyExistsOverwritesValue
{
    keychainStore = [[ABKeychainStore alloc] init];
    NSString *key = @"key";
    [keychainStore setString:@"blahblahblah" forKey:key];
    
    NSString *expectedString = @"expected string";
    [keychainStore setString:expectedString forKey:key];
    
    NSString *actualString = [keychainStore stringForKey:key];
    XCTAssertEqualObjects(expectedString, actualString);
}

@end

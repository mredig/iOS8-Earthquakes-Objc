//
//  LSIQuakesTests.m
//  iOS8-Earthquakes-ObjcTests
//
//  Created by Michael Redig on 10/8/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//


#import <XCTest/XCTest.h>
#import "LSIFileHelper.h"

@interface LSIQuakesTests : XCTestCase

@end

@implementation LSIQuakesTests

- (void)testFileHelper {
	NSBundle* bundle = [NSBundle bundleForClass:[self class]];
	NSData* data = loadFile(@"Quake.json", bundle);

	XCTAssertNotNil(data);
	NSLog(@"Data: %@", data);
}

- (void)testParseQuakeJSON {
	NSBundle* bundle = [NSBundle bundleForClass:[self class]];
	NSData* data = loadFile(@"Quake.json", bundle);

	NSError* error = nil;
	NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

	NSLog(@"Error: %@", error);
	NSLog(@"JSON: %@", json);
}

@end

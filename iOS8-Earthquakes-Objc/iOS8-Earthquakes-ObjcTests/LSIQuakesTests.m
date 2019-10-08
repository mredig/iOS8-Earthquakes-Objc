//
//  LSIQuakesTests.m
//  iOS8-Earthquakes-ObjcTests
//
//  Created by Michael Redig on 10/8/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//


#import <XCTest/XCTest.h>
#import "LSIFileHelper.h"
#import "LSIQuake.h"

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
	NSDictionary* quakeJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

	NSLog(@"Error: %@", error);
	NSLog(@"JSON: %@", quakeJSON);

	NSDate* expectedDate = [NSDate dateWithTimeIntervalSince1970: (1388620296020.0 / 1000.0)];

	LSIQuake* quake = [[LSIQuake alloc] initWithDictionary: quakeJSON];
	XCTAssertNotNil(quake);

	// test all properties are parsing correctly
	XCTAssertEqualWithAccuracy(1.29, quake.magnitude, 0.001);
	XCTAssertEqualObjects(expectedDate, quake.time);
	XCTAssertEqualObjects(@"10km SSW of Idyllwild, CA", quake.place);
	XCTAssertEqualWithAccuracy(-116.7776667, quake.longitude, 0.001);
	XCTAssertEqualWithAccuracy(33.663333299999998, quake.latitude, 0.001);

}

@end

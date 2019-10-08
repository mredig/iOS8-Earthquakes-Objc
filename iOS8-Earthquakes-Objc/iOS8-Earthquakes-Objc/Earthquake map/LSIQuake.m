//
//  LSIQuake.m
//  iOS8-Earthquakes-Objc
//
//  Created by Michael Redig on 10/8/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import "LSIQuake.h"

@implementation LSIQuake

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super init]) {
		// TODO: replace with constants for keys
		NSDictionary* propertiesDict = dictionary[@"properties"];
		NSNumber* magNumber = propertiesDict[@"mag"];
		NSString* placeString = propertiesDict[@"place"];
		NSNumber* timeNumber = propertiesDict[@"time"];
		NSDictionary* geometry = dictionary[@"geometry"];
		NSArray* coordinates = geometry[@"coordinates"];
		NSNumber* longitudeNumber = coordinates[0];
		NSNumber* latitudeNumber = coordinates[1];
		//		NSNumber* latitudeNumber = propertiesDict[

		if (magNumber != nil &&
			placeString != nil &&
			timeNumber != nil &&
			latitudeNumber != nil &&
			longitudeNumber != nil) {
			_magnitude = [magNumber doubleValue];
			_place = placeString;
			NSTimeInterval timestamp = [timeNumber doubleValue];
			_time = [NSDate dateWithTimeIntervalSince1970: (timestamp / 1000.0)];
			_longitude = [longitudeNumber doubleValue];
			_latitude = [latitudeNumber doubleValue];
		} else {
			NSLog(@"Error unable to parse earthquake: %@", dictionary);
			return nil;
		}

	}
	return self;
}

@end

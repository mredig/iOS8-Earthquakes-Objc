//
//  LSIQuake.h
//  iOS8-Earthquakes-Objc
//
//  Created by Michael Redig on 10/8/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIQuake : NSObject

@property double magnitude;
@property NSString* place;
@property NSDate* time;
@property double latitude;
@property double longitude;


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END

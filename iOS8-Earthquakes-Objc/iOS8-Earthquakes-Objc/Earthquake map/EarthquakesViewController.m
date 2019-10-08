//
//  EarthquakesViewController.m
//  iOS8-Quakes-Objc
//
//  Created by Paul Solt on 10/8/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "EarthquakesViewController.h"
#import <MapKit/MapKit.h>
#import "LSIQuakeFetcher.h"

@interface EarthquakesViewController ()

//@IBOutlet var mapView: MKMapView!  // Swift
@property (strong, nonatomic) IBOutlet MKMapView *mapView;


@end

@implementation EarthquakesViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
	if (self = [super initWithCoder:coder]) {
		_quakeFetcher = [[LSIQuakeFetcher alloc] init];
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

	[self.quakeFetcher fetchQuakesWithCompletionBlock:^(NSArray *quakes, NSError *error) {
		NSLog(@"Quakes: %@", quakes);
		// TODO: MKAnnotation for mapkit view
	}];
}


@end

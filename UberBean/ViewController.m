//
//  ViewController.m
//  UberBean
//
//  Created by NICE on 2018-08-17.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "ViewController.h"
#import "Cafe.h"
#import "NetworkManager.h"
@import MapKit;
@import CoreLocation;


@interface ViewController () <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic,strong) NSArray<Cafe*> *objects;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];

    [self.locationManager requestLocation];

    [self.locationManager startUpdatingLocation];

    [self.mapView setShowsUserLocation:YES];
    
    NSLog(@"Getting cafes");
    [NetworkManager getCafes:^(NSArray *cafes) {
        self.objects = cafes;
        NSLog(@"View controller got data: %@", self.objects);
        
    }];
    NSLog(@"Method finished");

}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"Moved to %@", locations[0]);
    
    MKCoordinateRegion currentRegion = MKCoordinateRegionMake(locations[0].coordinate, MKCoordinateSpanMake(0.1, 0.1));
    [self.mapView setRegion:currentRegion animated:YES];
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"did fail with error: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    NSLog(@"Authorization status changed: %d", status);
}

@end

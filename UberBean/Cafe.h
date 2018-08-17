//
//  Cafe.h
//  UberBean
//
//  Created by NICE on 2018-08-17.
//  Copyright © 2018 NICE. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;
@import MapKit;

@interface Cafe : NSObject <MKAnnotation>
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *latitude;
@property (nonatomic) NSString *longitude;
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;


- (instancetype)initWithInfo:(NSDictionary*)info;

@end

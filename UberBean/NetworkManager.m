//
//  NetworkManager.m
//  UberBean
//
//  Created by NICE on 2018-08-17.
//  Copyright © 2018 NICE. All rights reserved.
//

#import "NetworkManager.h"
#import "Cafe.h"

@implementation NetworkManager
+ (void)getCafes:(void (^)(NSArray* cafes))completion {
    NSURL *url = [NSURL URLWithString:@"https://api.yelp.com/v3/businesses/search?term=cafe&latitude=43.6447391&longitude=-79.394702"];
    
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest setValue:@"Bearer v90pQb-oRytQv786DjlMrrsb6fBWFsud7-y6ePgWrDhQZhWNjfhI8WsB2pevzxxs5jWFiOUpFyIgtKdcxCJAzsdJwZOMoT-aPpEUug5ozjBAJYdY4H_6KycsCil3W3Yx" forHTTPHeaderField:@"Authorization"];
    
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
//        NSInteger statusCode = [(NSHTTPURLResponse*)response statusCode];
//        if (statusCode < 200 || statusCode >= 300) {
//            NSLog(@"Non-OK error code: %@", response);
//            abort();
//        }
        
        NSError *jsonError = nil;
        NSDictionary* info = [NSJSONSerialization
                              JSONObjectWithData:data
                              options:0
                              error:&jsonError];
        
        NSMutableArray *cafes = [@[] mutableCopy];
        for (NSDictionary *cafeInfo in info[@"businesses"]) {
            [cafes addObject:[[Cafe alloc] initWithInfo:cafeInfo]];
        }
        completion(cafes);

    }];
    
    [downloadTask resume];
}
@end

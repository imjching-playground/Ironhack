//
//  TraktAPIClient.m
//  ShowTracker
//
//  Created by Carlos Butron on 28/04/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

#import "TraktAPIClient.h"

// Set this to your Trakt API Key
NSString * const kTraktAPIKey = @"ea8175668ee877bc128e467b18a53f48c8ffd9f151aa557dcf7a12f43f8de676";
NSString * const kTraktBaseURLString = @"https://api-v2launch.trakt.tv";
//NSString * const kTraktBaseURLString = @"http://api.trakt.tv";

@implementation TraktAPIClient

+ (TraktAPIClient *)sharedClient {
    static TraktAPIClient *_sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kTraktBaseURLString]];
    });
    return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    return self;
}

- (void)getShowsForDate:(NSDate *)date
               username:(NSString *)username
           numberOfDays:(int)numberOfDays
                success:(void(^)(NSURLSessionDataTask *task, id responseObject))success
                failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMdd";
    NSString* dateString = [formatter stringFromDate:date];
    
    NSString* path = [NSString stringWithFormat:@"user/calendar/shows.json/%@/%@/%@/%d",
                      kTraktAPIKey, username, dateString, numberOfDays];
    
    [self GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(task, error);
        }
    }];
}

@end

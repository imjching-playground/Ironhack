//
//  ShowsProvider.m
//  Models
//
//  Created by Joan Romano on 6/2/15.
//  Copyright (c) 2015 Produkt. All rights reserved.
//

#import "ShowsProvider.h"
#import "Show.h"

@interface ShowsProvider ()

@property (strong,nonatomic) RequestManager *requestManager;

@end

@implementation ShowsProvider

- (instancetype)init
{
    self = [super init];
    if (self) {
        _requestManager=[[RequestManager alloc] init];
    }
    return self;
}
- (void)showsWithSuccessBlock:(RequestManagerSuccess)successBlock errorBlock:(RequestManagerError)errorBlock{
    NSString *path=@"shows.json";
    NSDictionary *parameters=@{};
    [self.requestManager GET:path parameters:parameters successBlock:^(id data) {
        
        NSArray *shows = [MTLJSONAdapter modelsOfClass:[Show class] fromJSONArray:[data valueForKey:@"shows"] error:nil];
        successBlock(shows);
    } errorBlock:^(NSError *error) {
        errorBlock(error);
    }];
}

@end

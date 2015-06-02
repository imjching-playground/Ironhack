//
//  RequestManager.m
//  Models
//
//  Created by Joan Romano on 6/2/15.
//  Copyright (c) 2015 Produkt. All rights reserved.
//

#import "RequestManager.h"
#import <AFHTTPRequestOperationManager.h>

@implementation RequestManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _baseDomain=@"http://ironhack4thweek.s3.amazonaws.com";
    }
    return self;
}
- (void)GET:(NSString *)path parameters:(id)parameters successBlock:(RequestManagerSuccess)successBlock errorBlock:(RequestManagerError)errorBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[self.baseDomain stringByAppendingPathComponent:path] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock(error);
    }];
}

@end

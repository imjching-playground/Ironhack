//
//  RequestManager.h
//  Models
//
//  Created by Joan Romano on 6/2/15.
//  Copyright (c) 2015 Produkt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestManager : NSObject

typedef void (^RequestManagerSuccess)(id data);
typedef void (^RequestManagerError)(NSError *error);

@property (copy,nonatomic) NSString *baseDomain;

- (void)GET:(NSString *)path parameters:(id)parameters successBlock:(RequestManagerSuccess)successBlock errorBlock:(RequestManagerError)errorBlock;

@end

//
//  ShowsProvider.h
//  Models
//
//  Created by Joan Romano on 6/2/15.
//  Copyright (c) 2015 Produkt. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RequestManager.h"

@interface ShowsProvider : NSObject

- (void)showsWithSuccessBlock:(RequestManagerSuccess)successBlock errorBlock:(RequestManagerError)errorBlock;

@end

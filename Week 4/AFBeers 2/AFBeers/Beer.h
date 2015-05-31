//
//  Beer.h
//  AFBeers
//
//  Created by Marc on 27/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface Beer : MTLModel <MTLJSONSerializing>

@property NSString *name;
@property NSString *information; // beer description
@property NSString *labelImageURL; // Large image
@property NSString *labelThumbnailURL; // Small image

@end

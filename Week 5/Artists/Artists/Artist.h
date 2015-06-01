//
//  Artist.h
//  Artists
//
//  Created by Carlos Butron on 01/06/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artist : NSObject <NSCoding>

@property NSInteger artistID;
@property (nonatomic, copy) NSString *longDescription;
@property (nonatomic, copy) NSURL *imageURL;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *stage;
@property (nonatomic, copy) NSDate *startDate;



- (instancetype)initWithArtistID:(NSInteger)artistID
              andLongDescription:(NSString *)longDescription
                     andImageURL:(NSURL *)imageURL
                         andName:(NSString *)name
                        andStage:(NSString *)stage
                    andStartDate:(NSDate *)startDate;

+ (instancetype)randomArtist;




@end

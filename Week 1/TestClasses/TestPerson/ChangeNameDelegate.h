//
//  ChangeNameDelegate.h
//  TestPerson
//
//  Created by Carlos Butron on 04/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#ifndef TestPerson_ChangeNameDelegate_h
#define TestPerson_ChangeNameDelegate_h

@protocol ChangeNameDelegate <NSObject>

@optional
- (void)didChangeName:(NSString *)newName;



@end


#endif

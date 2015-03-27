//
//  Event.h
//  MeetMeUp
//
//  Created by Ronald Hernandez on 3/23/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Event : NSObject

@property NSString *eventName;
@property NSString *eventAddress;
@property NSString *RSVPCount;
@property NSString  *eventDescription;


-(instancetype)initWithDictionary:(NSDictionary *)eventsDictionary;


@end

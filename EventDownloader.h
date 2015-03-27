//
//  EventDownloader.h
//  MeetMeUp
//
//  Created by Ronald Hernandez on 3/27/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EventDownloaderDelegate <NSObject>

-(void)gotEvents:(NSArray *)EventsInfoArray;

@end

@interface EventDownloader : NSObject

@property id<EventDownloaderDelegate>ParentVC;

-(void)pullEventsFromMeetUpAPI;


@end

//
//  EventDownloader.m
//  MeetMeUp
//
//  Created by Ronald Hernandez on 3/27/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import "EventDownloader.h"
#import "event.h"

@implementation EventDownloader

//Need to pull Meet Up information down from MeetUp API.
-(void)pullEventsFromMeetUpAPI{
//Step 1. - Create a URL
    NSURL *url = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=94104&text=mobile&time=,1w&key=1e537f23776847f1c32701c42315d"];
//Step 2. - Create a Request

    NSURLRequest *request = [NSURLRequest requestWithURL:url];

//Step 3. - Create a connection
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

        [self downloadComplte:data];

    }];

}

//Step 4. Create a helper method to notify the ParentVC that the download is complete.

-(void)downloadComplte:(NSData *)data{

    //Store all of the events in dictionary.
    NSDictionary *eventsDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];


    //We have an array of dictionaries 
    NSArray *results =[eventsDictionary objectForKey:@"results"];

    //notify the parent that event info has been downloaded.
    [self.ParentVC gotEvents:results];


}
@end

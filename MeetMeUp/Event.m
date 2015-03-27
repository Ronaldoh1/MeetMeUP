//
//  Event.m
//  MeetMeUp
//
//  Created by Ronald Hernandez on 3/23/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import "Event.h"

@implementation Event


-(instancetype)initWithDictionary:(NSDictionary *)eventsDictionary{
    self = [super init];

    self.eventName = eventsDictionary[@"name"];
   // self.eventAddress = [NSString stringWithFormat:@"%@ %@", [[eventsDictionary objectForKey:@"venue"], objectForKey:@"address_1"]];
    self.RSVPCount = [[eventsDictionary objectForKey:@"yes_rsvp_count"] stringValue];
    self.eventDescription = [eventsDictionary objectForKey:@"description"];
    
    return self;
}

//+(NSArray *)eventArrayFromDictionaryArray:(NSArray *)DictArray{
//    NSMutableArray *muteArray = [NSMutableArray new];
//    for (NSDictionary *dict in DictArray){
//        Event *event =[[Event alloc] initWithDictionary:dict];
//        [muteArray addObject:event];
//
//    }
//    return [NSArray arrayWithArray:muteArray];
//}


//-(void *)pullEventsFromMeetUpApi{
//    //Create URL from String
//    NSURL *url  = [NSURL URLWithString:@"https://api.meetup.com/2/open_events.json?zip=94104&text=mobile&time=,1w&key=1e537f23776847f1c32701c42315d"];
//
//    //Create an NSURLRequest with the URL created.
//    NSURLRequest *request =[NSURLRequest requestWithURL:url];
//
//    //---Fetch the data asynchronously(in the background)--//
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//
//        //---save the Data coming back from the request ----//
//        NSDictionary *dictionary= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        //--add the results in a dictionary--//
//        self.eventsArray = [dictionary objectForKey:@"results"];
//
//        //NSLog(@"%@",self.eventsArray);
//        //--reload table view after the data has loaded--//
//       // [self.tableView reloadData];
//    }];
//}





//@property NSString *eventName;
//@property NSString *eventAddress;
//@property NSInteger RSVPCount;
//@property NSString  *eventDescription;
//@property NSString  *hostName;
//@property NSString  *joinMode;

//-(instancetype)init{
//    self = [super init];
//    self.eventsDictionary =[[NSDictionary alloc]init];
//    return self;
//}

//-(void)getEventInformation:(NSURL*)url{
//
//    //Create an NSURLRequest with the URL created.
//    NSURLRequest *request =[NSURLRequest requestWithURL:url];
//
//    //---Fetch the data asynchronously(in the background)--//
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//
//        //---save the Data coming back from the request ----//
//        self.eventsDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//        //--add the results in a dictionary--//
//        self.eventsArray = [self.eventsDictionary objectForKey:@"results"];
//        
//
//
//    }];
//
//}
//-(void)getHostInformation:(NSURL *)url{
//
//
//}

@end

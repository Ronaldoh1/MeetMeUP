//
//  ViewController.m
//  MeetMeUp
//
//  Created by Ronald Hernandez on 3/23/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import "EventTableViewController.h"
#import "Event.h"
#import "EventDownloader.h"
#import "EventDetailViewController.h"


@interface EventTableViewController ()<UITableViewDelegate, UITableViewDataSource,EventDownloaderDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSDictionary *eventsDictionary;
@property NSDictionary *venueDictionary;
@property NSMutableArray *arrayOfEventObjects;
@property EventDownloader *downloader;




@end

@implementation EventTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //Need to initialize a downloader object .
    self.downloader = [EventDownloader new];
    //set the delegate.
    self.downloader.ParentVC = self;
    //need to call the method in the downloader class to pull down the data.
    [self.downloader pullEventsFromMeetUpAPI];

    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];


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

-(void)gotEvents:(NSArray *)EventsInfoArray{


    for (NSDictionary *dict in EventsInfoArray) {
        

        Event *event =[[Event alloc]initWithDictionary:dict];
        
        [self.arrayOfEventObjects addObject:event];

    }
    [self.tableView reloadData];
    
}


#pragma mark - Tableview Methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //--pass the events array (which is an array of results)

   // Event *event = self.eventsArray[indexPath.row];


    //--initialize the cell with the cell identifier.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];

    self.eventsDictionary = [self.arrayOfEventObjects objectAtIndex:indexPath.row];

    //--set the text of cell.textlabel.text to the each item in the array for a specific key.--//

  //  self.venueDictionary = [self.eventsDictionary objectForKey:@"venue"];
    cell.textLabel.text = [[self.arrayOfEventObjects objectAtIndex:indexPath.row]eventName];

    //event.eventName;
    //cell.textLabel.numberOfLines = 0;

    //--create a separate dictionary that will be used for subtitles etc. This will be allow us to go in the second array.

//    NSDictionary *addressDictionary = [dictionary objectForKey:@"venue"];

    //--set the detail to the address - the formatting is done in the object class.

    //cell.detailTextLabel.text = [self.venueDictionary objectForKey:@"address_1"];//@"hi";//event.eventAddress;
    cell.detailTextLabel.textColor = [UIColor redColor];
    cell.detailTextLabel.numberOfLines = 0;

    //---set an image for the cell.
    cell.imageView.image = [UIImage imageNamed:@"meetup"];
   

    //--return the cell --//

    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    //--return the number of cells based on the number of events--//

    return self.arrayOfEventObjects.count;
}


@end

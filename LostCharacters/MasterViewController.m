//
//  MasterViewController.m
//  LostCharacters
//
//  Created by S on 10/21/14.
//  Copyright (c) 2014 Ryan Siska. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@property NSArray *characters;

@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (self.characters.count == 0)
    {
        [self pullFromPList];
    }
    else
    {
        //will be loadData
    }

}

-(void)pullFromPList
{
    NSURL *url = [NSURL URLWithString:@"http://s3.amazonaws.com/mobile-makers-assets/app/public/ckeditor_assets/attachments/2/lost.plist"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        {
            NSError *connectionError = nil;
            if (data)
            {
                NSDictionary *dict = [NSPropertyListSerialization propertyListWithData:data options:NSPropertyListReadCorruptError format:NULL error:&connectionError];
                //NSArray *tempDataArray = [dict objectForKey:@""];
                for (NSDictionary *dictionary in dict)
                {
                    NSManagedObject *character = [NSEntityDescription insertNewObjectForEntityForName:@"Character" inManagedObjectContext:self.managedObjectContext];

                    [character setValue:[dictionary objectForKey:@"actor"] forKey:@"actor"];
                    [character setValue:[dictionary objectForKey:@"passenger"] forKey:@"passenger"];
                    [self.managedObjectContext save:nil]; //the save is the error state - don't set to nil in an actual app
                    [self loadData];
                }
            }
        }
        NSLog(@"Connection Error: %@", connectionError); //don't think I want to reuse the same term "connectionError" throughout the app
    }];
}

@end


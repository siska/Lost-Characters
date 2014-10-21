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
                for (NSDictionary *dictionary in dict) {
                    NSString *actor = [dictionary objectForKey:@"actor"];
                    NSString *passenger = [dictionary objectForKey:@"passenger"];
                    NSLog(@"%@", actor);
                    NSLog(@"%@", passenger);
                }





                //NSLog(@"%@", dict);




            }
        }
    }];

    /*
        {
            NSError *jsonError = nil;
            if (data)
            {
                NSDictionary *tempDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                NSArray *tempDataArray = [tempDictionary objectForKey:@"data"];

                for (NSDictionary *tempDictionary in tempDataArray) //to be able to pull objectForKeys from Dictionary
                {
                    if (self.photos.count < 10)
                    {
                        NSDictionary *tempImagesDictionary = [tempDictionary objectForKey:@"images"];
                        NSDictionary *tempLowResDictionary = [tempImagesDictionary objectForKey:@"low_resolution"];
                        NSString *tempURLString = [tempLowResDictionary objectForKey:@"url"];

                        PhotoInfo *photo = [[PhotoInfo alloc] initWithImage:tempURLString]; //learned this - taylors meetup project implementation
                        [self.photos addObject:photo];
                    }
                }
                NSLog(@"self.photos %@", self.photos);
                [self.imageCollectionView reloadData];
                [self.imageCollectionView setContentOffset:CGPointZero animated:YES];
            }
            NSLog(@"Connection Error: %@", connectionError);
            NSLog(@"JSON Error: %@", jsonError);


        NSLog(@"%@", dict);
    }];*/
}

@end

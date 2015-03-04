//
//  detailViewController.m
//  espdb_2.2
//
//  Created by dj-jhon on 2/16/15.
//  Copyright (c) 2015 dj-jhon. All rights reserved.
//

#import "detailViewController.h"

@interface detailViewController ()

@end

@implementation detailViewController
@synthesize namelabel,countrylabel,popullabel,current;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setLabels];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getcity:(id)cityObjet
{
    current=cityObjet;
}

-(void)setLabels
{
    namelabel.text=current.cityName;
    popullabel.text=current.cityPopul;
    countrylabel.text=current.cityCountry;

}







@end

//
//  detailViewController.h
//  espdb_2.2
//
//  Created by dj-jhon on 2/16/15.
//  Copyright (c) 2015 dj-jhon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "city.h"

@interface detailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *namelabel;

@property (strong, nonatomic) IBOutlet UILabel *countrylabel;

@property (strong, nonatomic) IBOutlet UILabel *popullabel;



@property(nonatomic,strong)city*current;


#pragma -
#pragma mark-methode

-(void)getcity:(id)cityObjet;
-(void)setLabels;

@end

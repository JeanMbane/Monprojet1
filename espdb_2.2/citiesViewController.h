//
//  citiesViewController.h
//  espdb_2.2
//
//  Created by dj-jhon on 2/16/15.
//  Copyright (c) 2015 dj-jhon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface citiesViewController : UITableViewController

@property(nonatomic,strong)NSMutableArray*jsonarray;
@property(nonatomic,strong)NSMutableArray*citiesarray;//on le declare souforme de tableau


#pragma -
#pragma mark -class methode
-(void) retievedData;//la metode qui vas nous permetre de lire le json


@end

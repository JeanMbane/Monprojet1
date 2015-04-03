//
//  ViewController.m
//  swipe
//
//  Created by jean mbane on 26/03/2015.
//  Copyright (c) 2015 jean mbane. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize imgaView,titreview;

//on impose index image a 8
int imagindex;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"star,query");
    textTblarry=[[NSMutableArray alloc] init];
    //on initialise la note imagetablearray
    imgtblarry=[[NSMutableArray alloc]init];
    imagindex=0;

    [self recup];
    
}
- (void) recup
{
   
    
    //on recupaire les information de la base de bonne "Parse.."
    
    PFQuery *query=[PFQuery queryWithClassName:@"Dataimage"];
    
    
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error)
        {
            
            for (PFObject *objet in objects) {
                
                PFFile*list=objet[@"listimage"];
                [list getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                    if(!error){
                       //TODO
                    }
                    
                    //on cree un tableau content toutes les image recuper
                    [imgtblarry addObject:data];
                    [textTblarry addObject:objet];
                    
                    
                    //on verifie dans la consol
                    //  NSLog(@"on a pris la valeur data");
                    
                }];
            }
            
        }
    
    }];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)swipeMv:(UIGestureRecognizer *)sender {
    //on declar la variable qui vas faire qui vas commender les differnc geste.
    
    
    NSLog(@"voir ic ==%@",textTblarry);
    
    
    
    UISwipeGestureRecognizerDirection direction =[(UISwipeGestureRecognizer *)sender direction];
    
    switch (direction) {
            //on desincrement de la droite vers la gauche...
        case UISwipeGestureRecognizerDirectionLeft:
            imagindex = (imagindex-1)%textTblarry.count;
            
            break;
            
            //on increment de la droite vers la gauche...
        case UISwipeGestureRecognizerDirectionRight:
            imagindex = (imagindex+1)%textTblarry.count;
            
            break;
        default:
            break;
            
    }
    titreview.text=[[textTblarry objectAtIndex:imagindex]objectForKey:@"Nom"];
    //on affiche l'image...
    imgaView.image=[UIImage imageWithData:[imgtblarry objectAtIndex:imagindex]];
    
    
}
@end

//
//  ViewController.h
//  lireETsauvegardedb
//
//  Created by dj-jhon on 2/17/15.
//  Copyright (c) 2015 dj-jhon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *Nom;
@property (strong, nonatomic) IBOutlet UITextField *Prenom;
@property (strong, nonatomic) IBOutlet UITextField *Age;

- (IBAction)savetext:(id)sender;

- (IBAction)lire:(id)sender;

-(IBAction)retireleclavier:(id)sender;

@property (strong, nonatomic) IBOutlet UITextView *resulteview;
@end

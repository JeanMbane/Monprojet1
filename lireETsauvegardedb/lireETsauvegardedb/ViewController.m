//
//  ViewController.m
//  lireETsauvegardedb
//
//  Created by dj-jhon on 2/17/15.
//  Copyright (c) 2015 dj-jhon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize Nom,Prenom,Age,resulteview;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)retireleclavier:(id)sender
{
    [self resignFirstResponder]; //on configure le clavier
}

//on sauvegarde les informations

- (IBAction)savetext:(id)sender {
    NSString*resulteLine=[NSString stringWithFormat:@"%@,%@,%@\n",self.Nom.text,self.Prenom.text,self.Age.text];
    
    NSString*docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0]; // pour savoir ou sont stoker les informations
    
    
   // resulteview.text=docPath;//pour l'afficher sur le portable
    
    //NSLog(@"%@",docPath);
    
    NSString*serveveur=[docPath stringByAppendingPathComponent:@"resut.csv"];//on declare le fichier qui vas nous servir de base de donne
    
    //on pose la condition au cas ou le fichier exite ou non
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:serveveur]) {
        [[NSFileManager defaultManager] createFileAtPath:serveveur contents:nil attributes:nil];//on cree le fichier si s'aexite pas
        
    }
    
    NSFileHandle *filhand=[NSFileHandle fileHandleForUpdatingAtPath:serveveur];//on configure le fichier 
    
    [filhand seekToEndOfFile];//on declare le pionteur le debute de la base
    [filhand writeData:[resulteLine dataUsingEncoding:NSUTF8StringEncoding ]];// on ecrite sur la base sur une base de 8
    
    [filhand closeFile];// on ferme le fichier
    
    //on remet le labelText a zero apres la sauvegarde 
    self.Nom.text=@"";
    self.Prenom.text=@"";
    self.Age.text=@"";
    
  //  NSLog(@"info save");//on affiche la console
}

- (IBAction)lire:(id)sender {
    // on cherche d'abors a localise le ficher
    
    NSString*dotPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES)objectAtIndex:0];
    
    NSString*serv=[dotPath stringByAppendingPathComponent:@"resut.csv"]; //le non du fichier
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:serv]) { // la condition si le fichier exite
        
        NSFileHandle*filehand=[NSFileHandle fileHandleForReadingAtPath:serv]; //on lie le fichier
        
        NSString*servResul=[[NSString alloc] initWithData:[filehand availableData] encoding:NSUTF8StringEncoding]; // on recuper le ficier
        
        [filehand closeFile]; // on ferme le fiche 
        self.resulteview.text=servResul; // on l'affiche
    }
    
    
    
}
@end

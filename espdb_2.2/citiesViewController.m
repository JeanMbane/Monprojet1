//
//  citiesViewController.m
//  espdb_2.2
//
//  Created by dj-jhon on 2/16/15.
//  Copyright (c) 2015 dj-jhon. All rights reserved.
//

#import "citiesViewController.h"
#import "city.h"
#import "detailViewController.h"

#define getDataURL @"http://127.0.0.1:5984/database_personnel/6e078d55fc8b9060ca151136af0006d2/dataBaseEspr.json"  //c'est l'addre de la db couchdb

@interface citiesViewController ()

@end

@implementation citiesViewController
@synthesize jsonarray,citiesarray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //le titre de l'objets
    
  self.title=@"cites of world";
    
//on appelle la methode retiveddate
    
    [self retievedData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return citiesarray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    city*obcity;
    obcity=[citiesarray objectAtIndex:indexPath.row ];
    
    cell.detailTextLabel.text=obcity.cityCountry;
    
    cell.textLabel.text=obcity.cityName;
    
   
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

//la methode du segue qui permet de donne les detail de l'information......

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"dvSegue"]) {
        NSIndexPath*indexpath=[self.tableView indexPathForSelectedRow];
        //get les elemt
        city*objt=[citiesarray objectAtIndex:indexpath.row];
        
        [[segue destinationViewController]getcity:objt];
    }

}


//la methode qui permet de prelever les informatiom

#pragma mark -class methode

-(void)retievedData
{
    NSURL*url=[NSURL URLWithString:getDataURL];
    NSData*data=[NSData dataWithContentsOfURL:url];
    
    jsonarray=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    //on initialise citiies array
    
    citiesarray=[[NSMutableArray alloc]init];
    
    //on parcoure notre json et on prelever les information voule
    
    for(int i=0;i<jsonarray.count;i++)
    {
        //on cree notre citiies objet
        
        NSString*cID=[[jsonarray objectAtIndex:i] objectForKey:@"id"];
        NSString*cName=[[jsonarray objectAtIndex:i] objectForKey:@"cityName"];
        NSString*cCountry=[[jsonarray objectAtIndex:i] objectForKey:@"cityCountry"];
        NSString*cPopul=[[jsonarray objectAtIndex:i] objectForKey:@"cityPopul"];
        
        
        //on recuper les elemt du tableau et on les attribu a citii arrays
        
        [citiesarray addObject:[[city alloc] initWithCityid:cID andcityName:cName andcityPopul:cPopul andcityCountry:cCountry]];
    }
    
    //on relie notre data soufrm de tbleau
    
    [self.tableView reloadData];
    
}

@end

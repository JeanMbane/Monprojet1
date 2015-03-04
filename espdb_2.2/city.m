//
//  city.m
//  espdb_2.2
//
//  Created by dj-jhon on 2/16/15.
//  Copyright (c) 2015 dj-jhon. All rights reserved.
//

#import "city.h"

@implementation city
@synthesize cityCountry,cityid,cityName,cityPopul;

-(id)initWithCityid:(NSString*)cID andcityName:(NSString*)cName andcityPopul:(NSString*)cPopul andcityCountry:(NSString*)cCountry
{
    self=[super init];
    
    if(self)
    {
        cityid=cID;
        cityName=cName;
        cityCountry=cCountry;
        cityPopul=cPopul;
        
    }
    
    return self;
}

@end

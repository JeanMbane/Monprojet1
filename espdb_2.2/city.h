//
//  city.h
//  espdb_2.2
//
//  Created by dj-jhon on 2/16/15.
//  Copyright (c) 2015 dj-jhon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface city : NSObject

@property(nonatomic,strong)NSString*cityName;
@property(nonatomic,strong)NSString*cityid;
@property(nonatomic,strong)NSString*cityPopul;
@property(nonatomic,strong)NSString*cityCountry;

//methods que nous allons set up
#pragma -
#pragma mark -class methode
-(id)initWithCityid:(NSString*)cID andcityName:(NSString*)cName andcityPopul:(NSString*)cPopul andcityCountry:(NSString*)cCountry;


@end

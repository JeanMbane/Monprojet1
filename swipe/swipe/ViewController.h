//
//  ViewController.h
//  swipe
//
//  Created by jean mbane on 26/03/2015.
//  Copyright (c) 2015 jean mbane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
       NSString *textlist;
        NSMutableArray *imagaryy;
    NSMutableArray*imgtblarry;
    NSMutableArray*textTblarry;
    
}
@property (strong, nonatomic) IBOutlet UILabel *titreview;

@property (strong, nonatomic) IBOutlet UIImageView *imgaView;
- (IBAction)swipeMv:(UIGestureRecognizer *)sender;

@end


//
//  DemoSelector.m
//  TechmasterApp
//
//  Created by Hoàng Tiến on 9/28/15.
//  Copyright © 2015 Techmaster. All rights reserved.
//

#import "DemoSelector.h"

@interface DemoSelector ()
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation DemoSelector

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performSelector:@selector(hideSlider) withObject:nil afterDelay:5];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)onCrunchData:(id)sender {
    //[self performSelectorInBackground:@selector(doCrunchData) withObject:nil];
    [self performSelectorOnMainThread:@selector(doCrunchData:) withObject:nil waitUntilDone:true];
    [self performSelectorOnMainThread:@selector(processData:) withObject: @{@"cơm" : @"rice" , @"xanh" : @"blue"} waitUntilDone:true];
}

-(void) doCrunchData : (id)sender {
    [NSThread sleepForTimeInterval:2];
}
-(void) hideSlider{
    self.slider.hidden  = true  ;
}
-(void) processData: (NSDictionary*) data
{
    for (NSString* key in [data allKeys]) {
        NSLog(@"%@ - %@", key, [data valueForKey:key]);
}
}
@end

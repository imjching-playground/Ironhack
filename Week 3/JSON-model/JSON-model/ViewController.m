//
//  ViewController.m
//  JSON-model
//
//  Created by Carlos Butron on 21/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"
#import <JSONModel/JSOnModelLib.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *realName;
@property (weak, nonatomic) IBOutlet UIImageView *photo;

@end

@implementation ViewController

- (IBAction)actionShake:(id)sender {
    
    NSString * address = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?q=%@,es", self.textField.text];
    
    [JSONHTTPClient getJSONFromURLWithString:address completion:^(id json, JSONModelError *err) {
    
        NSLog(@"data: %@", json);
        
        NSDictionary * response = json;
        
        NSDictionary *main = response[@"name"];
        

    
    }];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

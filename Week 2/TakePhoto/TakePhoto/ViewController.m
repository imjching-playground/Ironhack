//
//  ViewController.m
//  TakePhoto
//
//  Created by Carlos Butron on 11/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"
#import "PicketViewController.h"

@interface ViewController ()

@property UIImagePickerController * picker;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property UIImage * myImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)chooseImage:(id)sender {
    
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = (id)self;
    
    self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker
                       animated:YES
                     completion:nil];
    
    
    
    
    
}


-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    self.myImage = [info valueForKey:@"UIImagePickerControllerOriginalImage"];
    
    [self.photoImageView setImage:self.myImage];
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];
    
    
    
    
    
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}








@end

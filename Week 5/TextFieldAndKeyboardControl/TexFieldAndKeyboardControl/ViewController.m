//
//  ViewController.m
//  TexFieldAndKeyboardControl
//
//  Created by Carlos Butron on 02/06/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *photoYorkieImageView;
@property (weak, nonatomic) IBOutlet UITextField *nameYorkieLabel;
@property (weak, nonatomic) IBOutlet UITextField *dateOfBirthYorkieLabel;
@property (weak, nonatomic) IBOutlet UITextField *genderYorkieLabel;
@property (weak, nonatomic) IBOutlet UITextField *weightYorkieLabel;

//property picker (male/female)
@property (nonatomic, strong) UIPickerView *myPickerView;
@property (nonatomic, strong) NSArray *pickerArray;
@property CGPoint originalCenter;
@property CGFloat currentKeyboardHeight;
@property CGFloat currentTextFieldOriginY;
@property CGFloat currentTextFieldHeight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    
    //original position of view
    self.originalCenter = self.view.center;
    
    [self addPickerView];
    
    //datepicker with birthday
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    datePicker.backgroundColor = [UIColor colorWithRed:123.0/255.0 green:178.0/255.0 blue:185.0/255.0 alpha:1];
    [datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    [self.dateOfBirthYorkieLabel setInputView:datePicker];
    
    
    
    //hide keyboard on enter
    self.nameYorkieLabel.delegate = self;
    self.dateOfBirthYorkieLabel.delegate = self;
    self.genderYorkieLabel.delegate = self;
    self.weightYorkieLabel.delegate = self;
    
    
}

//***** KEYBOARD CONTROL **********//
//control keyboard appears to move view position

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    //get the frame origin y of the active textField
    
    self.currentTextFieldOriginY = textField.frame.origin.y;
    self.currentTextFieldHeight = textField.frame.size.height;
    /* keyboard is visible, move views */
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.center = self.originalCenter;
    /* resign first responder, hide keyboard, move views */
}


- (void)keyboardWillShow:(NSNotification*)notification {
    
    
    NSDictionary *info = [notification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    CGFloat deltaHeight = kbSize.height - self.currentKeyboardHeight;
    //    NSLog(@"deltaHeight: %f - %f", kbSize.height, self.currentKeyboardHeight);
    //    NSLog(@"deltaheight: %f", deltaHeight);
    //    NSLog(@"self.view.center: %f", self.currentKeyboardHeight);
    //    NSLog(@"if (%f - %f < %f)", self.view.frame.size.height, deltaHeight, self.currentTextFieldOriginY+self.currentTextFieldHeight);
    //    NSLog(@"if (%f < %f)", self.view.frame.size.height-deltaHeight, self.currentTextFieldOriginY);
    //
    //    NSLog(@"CGPointMake: %f , %f", self.originalCenter.x, (self.currentTextFieldOriginY-(self.view.frame.size.height-deltaHeight)));
    //    NSLog(@"OriginalCGPointMake: %f , %f", self.originalCenter.x, self.originalCenter.y);
    
    //only if the position of keyboard is biggest than textfield
    if ((self.currentTextFieldOriginY+self.currentTextFieldHeight+25) > (self.view.frame.size.height-deltaHeight)) {
        self.view.center = CGPointMake(self.originalCenter.x, self.originalCenter.y + ((self.view.frame.size.height-deltaHeight)-(self.currentTextFieldOriginY+self.currentTextFieldHeight+25)) );
    }
    
    
}

- (void)keyboardWillHide:(NSNotification*)notification {
    self.view.center = self.originalCenter;
    self.currentKeyboardHeight = 0.0f;
}



//datepicker bornDate
- (void)updateTextField:(UIDatePicker *)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.dateOfBirthYorkieLabel.inputView;
    [picker setMaximumDate:[NSDate date]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    self.dateOfBirthYorkieLabel.text = [NSString stringWithFormat:@"%@",dateString];
}


- (void)addPickerView{
    self.pickerArray = [[NSArray alloc]initWithObjects:@"Male",@"Female", nil];
    self.myPickerView = [[UIPickerView alloc]init];
    self.myPickerView.backgroundColor = [UIColor colorWithRed:123.0/255.0 green:178.0/255.0 blue:185.0/255.0 alpha:1];
    self.myPickerView.dataSource = self;
    self.myPickerView.delegate = self;
    self.myPickerView.showsSelectionIndicator = YES;
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneClicked:)];
    [doneButton setTintColor:[UIColor colorWithRed:230.0/255.0 green:126.0/255.0 blue:34.0/255.0 alpha:1]];
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 100, 100, 50)];
    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    NSArray *toolbarItems = [NSArray arrayWithObjects: doneButton, nil];
    [toolBar setItems:toolbarItems];
    self.genderYorkieLabel.inputView = self.myPickerView;
    self.genderYorkieLabel.inputAccessoryView = toolBar;
    
}

- (void)doneClicked:(id)sender
{
    self.view.center = self.originalCenter;
    //*************and need to hide keyboard too**************
}



#pragma mark - Picker View Data source
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.pickerArray count];
}



#pragma mark- Picker View Delegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    [self.genderYorkieLabel setText:[self.pickerArray objectAtIndex:row]];
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.pickerArray objectAtIndex:row];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}





//get the name of the image in NSString format to save on SQLite

- (NSString *) getFileName:(UIImageView *)imgView{
    
    NSString *imgName = [imgView image].accessibilityIdentifier;
    
    NSLog(@"%@",imgName);
    
    return imgName;
    
}


//hide keyboard on return
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
//hide keyboard on touch outside textField
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end

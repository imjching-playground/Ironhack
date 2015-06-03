//
//  DetailViewController.m
//  BadHunter
//
//  Created by Joan Romano on 6/2/15.
//  Copyright (c) 2015 Joan Romano. All rights reserved.
//

#import "AgentEditViewController.h"


@interface AgentEditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *appraisalLabel;
@property (weak, nonatomic) IBOutlet UILabel *destructionPowerLabel;
@property (weak, nonatomic) IBOutlet UILabel *motivationLabel;
@property (weak, nonatomic) IBOutlet UIStepper *destructionPowerStepper;
@property (weak, nonatomic) IBOutlet UIStepper *motivationStepper;

@property (strong, nonatomic) NSArray *destroyPowerValues;
@property (strong, nonatomic) NSArray *motivationValues;
@property (strong, nonatomic) NSArray *appraisalValues;




@end

@implementation AgentEditViewController


#pragma mark - Managing the detail item
- (IBAction)saveAction:(id)sender {
    
    [self assignNameAgent];

    
    [self.delegate processDismiss:YES];
    
    
}

- (IBAction)actionPowerStepper:(id)sender {
    
    self.destructionPowerLabel.text = [self.destroyPowerValues objectAtIndex:self.destructionPowerStepper.value];
    [self assignDestroyPower];
    
}

- (IBAction)actionMotivationStepper:(id)sender {

    self.motivationLabel.text = [self.motivationValues objectAtIndex:self.motivationStepper.value];
    [self assignMotivation];
    
}

- (IBAction)cancelAction:(id)sender {

    [self.delegate processDismiss:NO];
    
}


- (void)setAgent:(id)agent {
    if (_agent != agent) {
        _agent = agent;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.agent) {
        [self initializeDestroyPowerViews];
        [self initializeMotivationViews];
        [self initializeAppraisalViews];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self assignAgentToView];
    [self configureView];
}


- (void)initializeDestroyPowerViews {
    self.destroyPowerValues = @[@"Soft", @"Weak", @"Potential", @"Destroyer", @"Nuke"];
    self.destructionPowerLabel.text = [self.destroyPowerValues objectAtIndex:0];
}

- (void)initializeMotivationViews {
    self.motivationValues = @[@"Doesn't care", @"Would like to", @"Quite", @"Interested", @"Focused"];
    self.motivationLabel.text = [self.motivationValues objectAtIndex:0];
}

- (void)initializeAppraisalViews {
    self.appraisalValues = @[@"No way", @"Better not", @"Maybe", @"Yes", @"A must"];
    self.appraisalLabel.text = [self.appraisalValues objectAtIndex:0];
}


-(void)assignAgentToView {
    
    self.nameTextField.text = [self.agent valueForKey:@"name"];
    self.destructionPowerLabel.text = [self.agent valueForKey:@"destructionPower"];
    self.motivationLabel.text = [self.agent valueForKey:@"motivation"];
    
}


- (void)assignNameAgent {
    [self.agent setValue:self.nameTextField.text forKey:@"name"];
}

- (void)assignDestroyPower{
    [self.agent setValue:@(self.destructionPowerStepper.value) forKey:@"destructionPower"];
}

- (void)assignMotivation {
    [self.agent setValue:@(self.motivationStepper.value) forKey:@"motivation"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

//
//  DetailViewController.m
//  BadHunter
//
//  Created by Joan Romano on 6/2/15.
//  Copyright (c) 2015 Joan Romano. All rights reserved.
//

#import "AgentEditViewController.h"

#import "Agent+Model.h"
#import "Domain+Model.h"
#import "FreakType+Model.h"
#import "ImageMapper.h"

typedef NS_ENUM(NSInteger, ImageStatus) {
    ImageStatusDoNothing = 0,
    ImageStatusPreserveNew,
    ImageStatusDelete
};

@interface AgentEditViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UIButton *imageButton;
@property (weak, nonatomic) IBOutlet UITextField *categoryTextField;
@property (weak, nonatomic) IBOutlet UITextField *domainsTextField;
@property (weak, nonatomic) IBOutlet UILabel *appraisalLabel;
@property (weak, nonatomic) IBOutlet UIStepper *destructionPowerStepper;
@property (weak, nonatomic) IBOutlet UILabel *destructionPowerLabel;
@property (weak, nonatomic) IBOutlet UIStepper *motivationStepper;
@property (weak, nonatomic) IBOutlet UILabel *motivationLabel;

@property (strong, nonatomic) NSArray *appraisalValues;
@property (strong, nonatomic) NSArray *destroyPowerValues;
@property (strong, nonatomic) NSArray *motivationValues;

@property (nonatomic) ImageStatus imageStatus;
@property (strong, nonatomic) UIImage *agentPicture;
@property (strong, nonatomic) ImageMapper *imageMapper;

@end

@implementation AgentEditViewController

#pragma mark - Managing the detail item

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageMapper = [[ImageMapper alloc] init];

    [self configureView];
}

- (void)configureView {
    if (self.agent) {
        [self displayAgentName];
        [self initializeDestroyPowerViews];
        [self initializeMotivationViews];
        [self initializeAppraisalView];
        [self initializePictureView];
    }
}

- (void) initializeDestroyPowerViews {
    self.destroyPowerValues = @[@"Soft", @"Weak", @"Potential", @"Destroyer", @"Nuke"];
    [self initializeDestructionPowerStepper];
    [self displayDestructionPowerLabel];
}

- (void) initializeDestructionPowerStepper {
    self.destructionPowerStepper.value = [self.agent.destructionPower floatValue];
}

- (void) initializeMotivationViews {
    self.motivationValues = @[@"Doesn't care", @"Would like to", @"Quite", @"Interested", @"Focused"];
    [self initializeMotivationStepper];
    [self displayMotivationLabel];
}

- (void) initializeMotivationStepper {
    self.motivationStepper.value = [self.agent.motivation floatValue];
}

- (void) initializeAppraisalView {
    self.appraisalValues = @[@"No way", @"Better not", @"Maybe", @"Yes", @"A must"];
    self.appraisalLabel.text = [self.appraisalValues objectAtIndex:self.agent.appraisal.integerValue];
}

- (void) initializePictureView {
    [self loadAgentPicture];
    [self displayAgentPicture];
}

- (void) loadAgentPicture {
    if (self.agent.pictureUUID) {
        self.agentPicture = [self.imageMapper retrieveImageWithUUID:self.agent.pictureUUID];
    }
}

- (void) viewWillAppear:(BOOL)animated {
    [self addObserverForProperties];
}

- (void)addObserverForProperties {
    [self addObserver:self forKeyPath:@"agent.destructionPower"
                   options:NSKeyValueObservingOptionNew context:NULL];
    [self addObserver:self forKeyPath:@"agent.motivation"
                   options:NSKeyValueObservingOptionNew context:NULL];
    [self addObserver:self forKeyPath:@"agent.appraisal"
              options:NSKeyValueObservingOptionNew context:NULL];
}

- (void) viewDidDisappear:(BOOL)animated {
    [self removeObserverForProperties];
}

- (void)removeObserverForProperties {
    [self removeObserver:self forKeyPath:@"agent.destructionPower"];
    [self removeObserver:self forKeyPath:@"agent.motivation"];
    [self removeObserver:self forKeyPath:@"agent.appraisal"];
}

#pragma mark - UI Actions

- (IBAction)cancel:(id)sender {
    [self.delegate dismissAgentEditViewController:self modifiedData:NO];
}

- (IBAction)save:(id)sender {
    [self assignDataToAgent];
    [self persistImageChanges];
    [self.delegate dismissAgentEditViewController:self modifiedData:YES];
}

- (void) persistImageChanges {
    if (self.imageStatus == ImageStatusPreserveNew) {
        if (self.agent.pictureUUID == nil) {
            self.agent.pictureUUID = [self.agent generatePictureUUID];
        }
        [self.imageMapper storeImage:self.agentPicture withUUID:self.agent.pictureUUID];
    } else if (self.imageStatus == ImageStatusDelete) {
            [self.imageMapper deleteImageWithUUID:self.agent.pictureUUID];
            self.agent.pictureUUID = nil;
    }
}

- (void) assignDataToAgent {
    [self assignName];
    [self assignCategory];
    [self assignDomains];
}

- (void)assignName {
    self.agent.name = self.nameTextField.text;
}

- (void) assignCategory {
    FreakType *freakType = nil;
    NSString *name = self.categoryTextField.text;
    if (name!= nil) {
        freakType = [FreakType fetchInMOC:self.agent.managedObjectContext
                                 withName:self.categoryTextField.text];
        if (freakType == nil) {
            freakType = [FreakType freakTypeInMOC:self.agent.managedObjectContext withName:name];
        }
    }
    self.agent.category = freakType;
}

- (void) assignDomains {
    NSString *domainsString = self.domainsTextField.text;
    if (domainsString != nil) {
        NSArray *domainNames = [domainsString componentsSeparatedByString:@","];
        NSMutableSet *domains = [[NSMutableSet alloc] initWithCapacity:[domainNames count]];
        Domain *domain;
        for (NSString *domainName in domainNames) {
            domain = [Domain fetchInMOC:self.agent.managedObjectContext
                                            withName:domainName];
            if (domain == nil) {
                domain = [Domain domainInMOC:self.agent.managedObjectContext withName:domainName];
            }
            [domains addObject:domain];
        }
        self.agent.domains = domains;
    }
}

- (IBAction)changeDestructionPower:(id)sender {
    NSUInteger newDestructionPower = (NSUInteger)(self.destructionPowerStepper.value + 0.5);
    self.agent.destructionPower = @(newDestructionPower);
}

- (IBAction)changeMotivation:(id)sender {
    NSUInteger newMotivation = (NSUInteger)(self.motivationStepper.value + 0.5);
    self.agent.motivation = @(newMotivation);
}

- (IBAction) editImage:(id)sender {
    [self offerImageActions];
}

- (void) offerImageActions {
    NSString *deleteButtonTitle = nil;
    if ((self.imageStatus == ImageStatusPreserveNew) || (self.agent.pictureUUID != nil)) {
        deleteButtonTitle = @"Delete Image";
    }
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"Cancel"
                                  destructiveButtonTitle:deleteButtonTitle
                                  otherButtonTitles:@"Choose From Library", nil];
    [actionSheet showInView:self.navigationController.view];
}

#pragma mark - Presentation

- (void) displayAgentName {
    self.nameTextField.text = self.agent.name;
}

- (void) displayDestructionPowerLabel {
    NSUInteger destructionPower = [self.agent.destructionPower unsignedIntegerValue];
    self.destructionPowerLabel.text = self.destroyPowerValues[destructionPower];
}

- (void) displayMotivationLabel {
    NSUInteger motivation = [self.agent.motivation unsignedIntegerValue];
    self.motivationLabel.text = self.motivationValues[motivation];
}

- (void) displayAppraisalLabel {
    NSUInteger appraisal = [self.agent.appraisal unsignedIntegerValue];
    self.appraisalLabel.text = self.appraisalValues[appraisal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) displayAgentPicture {
    [self.imageButton setImage:self.agentPicture forState:UIControlStateNormal];
}

#pragma mark - Action Sheet Delegate Methods

- (void) actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == actionSheet.destructiveButtonIndex) {
        [self deletePicture];
    } else if (buttonIndex != actionSheet.cancelButtonIndex)  {
        [self obtainPictureFromLibrary];
    }
}


- (void) obtainPictureFromLibrary {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.allowsEditing = YES;
    imagePicker.delegate = self;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}


- (void) deletePicture {
    self.imageStatus = ImageStatusDelete;
    self.agentPicture = nil;
    [self displayAgentPicture];
}

#pragma mark - Observations

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"agent.destructionPower"]) {
        [self displayDestructionPowerLabel];
    } else if ([keyPath isEqualToString:@"agent.motivation"]) {
        [self displayMotivationLabel];
    } else if ([keyPath isEqualToString:@"agent.appraisal"]) {
        [self displayAppraisalLabel];
    }
}

#pragma mark - Image picker view controller delegate

- (void) imagePickerController:(UIImagePickerController *)imagePickerController
 didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.agentPicture = info[UIImagePickerControllerEditedImage];
    [self displayAgentPicture];
    self.imageStatus = ImageStatusPreserveNew;
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Text field delegate

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    BOOL shouldReturn = YES;
    if (textField == self.nameTextField) {
        [textField resignFirstResponder];
        shouldReturn = NO;
    }

    return shouldReturn;
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.categoryTextField || textField == self.domainsTextField) {
        [self removeDecorationOfTextInTextField:textField];
    }
}


- (void) removeDecorationOfTextInTextField:(UITextField *)textField {
    textField.attributedText = [[NSAttributedString alloc] initWithString:textField.text
                                                               attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
}


- (void) textFieldDidEndEditing:(UITextField *)textField {
    BOOL exists = YES;
    if (textField == self.categoryTextField) {
        NSString *category = self.categoryTextField.text;
        exists = ([FreakType fetchInMOC:self.agent.managedObjectContext
                               withName:category] != nil);
        [self decorateTextField:textField withContents:@[category] values:@[@(exists)]];
    } else if (textField == self.domainsTextField) {
        NSString *domainsString = self.domainsTextField.text;
        NSArray *domains = [domainsString componentsSeparatedByString:@","];
        NSMutableArray *values = [[NSMutableArray alloc] initWithCapacity:[domains count]];
        for (NSString *domain in domains) {
            exists = ([Domain fetchInMOC:self.agent.managedObjectContext
                                withName:domain] != nil);
            [values addObject:@(exists)];
            if (domain !=nil) exists = !exists;
        }
        [self decorateTextField:textField withContents:domains values:values];
    }
}


- (void) decorateTextField:(UITextField *)textField withContents:(NSArray *)contents
                    values:(NSArray *)values {
    NSMutableAttributedString *coloredString = [[NSMutableAttributedString alloc] init];
    for (NSUInteger i = 0; i < [contents count]; i++) {
        BOOL exists = [[values objectAtIndex:i] boolValue];
        NSString *substring = [contents objectAtIndex:i];
        UIColor *decorationColor = (exists)?[UIColor greenColor]:[UIColor redColor];
        NSAttributedString *attributedSubstring = [[NSAttributedString alloc] initWithString:substring attributes:@{NSForegroundColorAttributeName: decorationColor}];
        [coloredString appendAttributedString:attributedSubstring];
        if (i < ([contents count] - 1)) {
            [coloredString appendAttributedString:[[NSAttributedString alloc] initWithString:@","]];
        }
    }
    textField.attributedText = coloredString;
}

@end

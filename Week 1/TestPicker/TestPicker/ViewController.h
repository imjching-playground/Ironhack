//
//  ViewController.h
//  TestPicker
//
//  Created by Carlos Butron on 07/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>


typedef enum {
   
    LanguageCountryPickerColumnCountries = 0,
    LanguageCountryPickerColumnLanguages = 1,
    LanguageCountryPickerColumnCities = 2
    
} LanguageCountryPickerColumn;


@end


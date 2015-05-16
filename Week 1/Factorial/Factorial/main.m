//
//  main.m
//  Factorial
//
//  Created by Carlos Butron on 04/05/15.
//  Copyright (c) 2015 Carlos Butron. All rights reserved.
//

#import <Foundation/Foundation.h>


void printFactor (long long a) {
    
    long long factorial = a;
    
    for (long long i=a-1; i>=1; i--) {
        
        a *= i;
        
    }
    
    printf("Factorial of %lli is: %lli", factorial, a);
    
}




typedef struct{
    
    char name[20];
    char surname[20];
    long phone;
    
} Person;


int main(int argc, const char * argv[]) {
    @autoreleasepool {

        
        
        long long myNumber = 13;
        
        printFactor(myNumber);
        
        
        
        
        
        // Sum Array code
        int myArrayWithNumbers[20] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
        
        int mySum =0;

        for (int i=0; i<20; i++){
            
            mySum += myArrayWithNumbers[i];
            
        }
        
        printf("\nResult of array sum is: %d", mySum);
        //end of sum array
        
        
        
        //struct Person sample code
        Person ps;
        
        strcpy(ps.name, "Carlos");
        strcpy(ps.surname, "Butron");
        ps.phone = 555555555;
        
        printf("\nYour name is: %s\nYour Surname is: %s\nYour phone number is: %ld", ps.name, ps.surname, ps.phone);
        //struct Person sample code
        
    }
    return 0;
}





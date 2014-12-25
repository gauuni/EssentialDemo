//
//  EssentialDemoTests.m
//  EssentialDemoTests
//
//  Created by Gau Uni on 11/25/14.
//  Copyright (c) 2014 iOS_Team_CO2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "EssentialLib/Validator.h"

@interface EssentialDemoTests : XCTestCase

@end

@implementation EssentialDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
            // Put the code you want to measure the time of here.
    }];
}

#pragma mark -
#pragma mark Validate email
/*************************************************************************************************************************/
-(void)testEmailNoSuffix
{
    BOOL isValidate = [Validator validateEmail:@"abc"];
    XCTAssertFalse(isValidate,@"This email is not valid");
}

-(void)testEmailValid
{
    BOOL isValidate = [Validator validateEmail:@"abc@gmail.com"];
    XCTAssertTrue(isValidate,@"This email is valid");
}

-(void)testEmailWithSpecialCharacter
{
    BOOL isValidate = [Validator validateEmail:@"ábaf@gmail.com"];
    XCTAssertFalse(isValidate,@"This email is not valid");
}

-(void)testEmailWithWhitespaceCharacter
{
    BOOL isValidate = [Validator validateEmail:@"ába f@gmail.com"];
    XCTAssertFalse(isValidate,@"This email is not valid");
}

/*************************************************************************************************************************/


#pragma mark -
#pragma mark Validate String
/*************************************************************************************************************************/
-(void)testNumericString
{
    BOOL isNumeric = [Validator isNumeric:@"5"];
    XCTAssertTrue(isNumeric,@"This is a number");
}

-(void)testNonNumericString
{
    BOOL isNumeric = [Validator isNumeric:@"a"];
    XCTAssertFalse(isNumeric,@"This is not a number");
}

/*************************************************************************************************************************/


@end

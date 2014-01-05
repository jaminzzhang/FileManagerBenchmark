//
//  FileManagerTest.h
//  FileManagerBenmark
//
//  Created by Jamin on 1/5/14.
//  Copyright (c) 2014 tencent. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface FileManagerTest : XCTestCase

@property (nonatomic) NSString * libPath;
@property (nonatomic) NSString * testPath;
@property (nonatomic) NSString * testTempPath;

@property (nonatomic) NSFileManager * fileManager;


@end

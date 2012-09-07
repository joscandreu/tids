//
//   Copyright 2012 jordi domenech <jordi@iamyellow.net>
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.
//

#import "NetIamyellowTidsModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "OpenUDID.h"

static NSString* const kOpenUDIDKey = @"NetIamyellowTidsModuleOpenUDID";

@implementation NetIamyellowTidsModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"20f7c238-afc5-4b14-a674-5d72e366675c";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"net.iamyellow.tids";
}

#pragma mark Cleanup 

-(void)dealloc
{
    if (keychain != nil) {
        RELEASE_TO_NIL(keychain);
    }
    
    if (_openUDID != nil) {
        RELEASE_TO_NIL(_openUDID);
    }

	[super dealloc];
}


#pragma Public APIs


-(id)openUDID
{
    if (_openUDID == nil) {
        if (keychain == nil) {
            keychain = [[NetIamyellowTidsModule_KeychainItemWrapper alloc] initWithIdentifier:kOpenUDIDKey accessGroup:nil];
        }

        NSString* keychainOpenUDID = [keychain objectForKey:(id)kSecValueData];
        if ([keychainOpenUDID length] > 0) {
            _openUDID = [keychainOpenUDID retain];
        }
        else {
            _openUDID = [NetIamyellowTidsModule_OpenUDID value];
            [keychain setObject:_openUDID forKey:(id)kSecValueData];
        }
    }
    return _openUDID;
}

/**
 * oldUDID
 * Copyright (c) 2009-2010 by Appcelerator, Inc. and licensed under the Apache Public License (version 2)
 */

-(id)oldUDID
{
    NSString* uid;
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(uniqueIdentifier)]) {
        
    	uid = [[UIDevice currentDevice] uniqueIdentifier];
        
    	if (uid) {
	        return uid;
        } else {
            return @"";
        }
        
    } else {
        return @"";
    }
}

@end

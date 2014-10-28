//
//  ViewController.h
//  parseTopic
//
//  Created by Kevin McQuown on 8/18/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeopleViewController : UIViewController

@end

/*
step 1
 - created new file of Person of type PFObject - could use that subclass when creating file, but then have to make sure to import the Foundation.h within the .h file 
 - Parse makes it necessary for us to add a few things for it to work - within the .h we had to include <PFSubclassing>
 - we added an instance method and some properties within the .h that we'll likely use later
 - in the .m, we declared the name and age as dynamic - Max said this is necessary, within the m we also had to add the class method of parseClassName which lets it know that the parse exists for type Person (per Max - something that could have been done by Parse, but we just need to recreate it), we also added the load (required) and put declared what our inst method does
 - the load loads whenever a person is used or something like that - something we can manipulate later
 
 step 2
 - did the same thing, but with a dog class - created as PFObject, imported the Foundation - set up properties in the .h and then in the .h, the load and parseClassName 
 -*** a cool thing frmo Max - just adding the owner property on dog creates the relationship for us between dog and person - not sure if it knows one to many or one to one of it thats even necessary
 
 step 3
 - imported person into the PeopleVC.m - within this section we want to set up the ability to get a person object back within refreshDisplay and then call that from the cellForRow...
 - filled in the refreshDisplay method - got a person back from parse, assigned it back into our persons array and then reloaded the tableView - wtihin the cellForRowetc. - we inited a Person object at the index and then set the cell text label to the person name
 - *** an important point here was that we used Person parseClassName within refreshDisplay - way to keep us from having to type in a string multiple times, which could become an issue, cause error with wrong string
 - we also changed the parse strings to be our own - parse was giving us back an error
 
 step 4
 - added information to the addPersonWithName - this was already set up to bring in a name and age - within this section we init a Person object which is part of the PFSubclassing - another portion where we make it simple to keep from getting errors - just use Person object instead of the objectForKey and putting in a string - this keeps from getting misspellings
 - we then save the Person to parse and then refresh the display
 - the refreshDisplay is the method we created - like CoreData like where we just save to parse and then reload the app with a fresh pull from parse
 
 step 5
 - similar to what we did with the Person thing before - we did the addDogWithName to allow for a user to input a dog name, it saves it to parse, then we added and called (fromAddDog) refreshDisplay to query for the dogs - changed cellForRow to show dog
 
 *** an important thing Max said - within this example, there will be a slight delay when a user tries to add a dog before it comes back from parse - what Max said was a workaround but tougher and more buggy if not done right is to save the dogs as an array too - show from the array immediately because it should be the same as what's on parse - then you pull or check from parse to make sure they're the same - gives the impression to the user that it worked correctly
 
 step 6
 - we just updated on PeopleVC.m the cellForRowAt... - did a new query to get the dogs back for the owner and then displayed the count within the detail portion
 - *** - an important thing to note was that we used the countObjectsInBackgroundWithBlock - another way would have been just to use countObjects .count or something to get back the count, but then we're going through every single dog and counting them up - with a lot of dogs, this would really slow down the app - instead we use the countObjectsInBackground... which is more convenient and less process heavy
 - another important thing to note is that we'll get the issue here with tableViews where the count will be assigned to the wrong person if someone scrolls to fast - within the kitten hackwich, we implemented a fix
 
 
 
 
 
 */

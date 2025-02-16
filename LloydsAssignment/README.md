# Lloyds (Assignment) 
========================================

## Summary

Thanks for providing the opportunity and considering for this round. 

This iOS application has the following features:
* After the launch screen, app opens with the list of comapnies.
* companies.json provided with this sample has been added into the bundle to mimic the service layer. JSONDecoder is used to parse the content of companies.json file.
* On this screen, the comapny information on a List with Filter option on top right corner.
* On tap of any row, will show the Details of the company
* Details contains historical data & full description having the option `Show more` or `Show less`
* Image caching using `ImageCache`

Optional features implemented:
* This a universal app supporting iPad as well.

In this project the key Views  are CompanyListView (responsible for showing the list of companies) and CompanyDetailsView (responsible for detailed information of a company). 


## Recommendations

Recommended Xcode version to build the project is Xcode 16.2 with minimum supported deployment target iOS 18.2.
 

## Project Structure

To keep the code files readable and uncluttered, below is the folder structure used in the project.

    ├─ Sources ────├─ DataLayer  ────├─ DataStore
                                     ├─ Networking ────├─ Services
                                                       ├─ NetworkManager
                                                       ├─ APIServiceError
                                    
                                     ├─ Repository ────├─ Load Data from url
                                                       ├─ Load Data from Local file
                                                       ├─ Load Data from Database(Not implemented, can be extended)
                                     ├─ Resources
                  
                   ├─ Domain     ────├─ Entities/Model
                                     ├─ Usecase
                                     
                   ├─ Presentation ────├─ Views
                                       ├─ ViewModels
                   
                   ├─ Utilities
                   ├─ Rootview
    
    


## Architecture
|
* Model-View-ViewModel with Clean Architecture
    * To avoid massive view controllers, MVVM is considered in this project.

### “Event” Patterns used in this project

* SwiftUI, Combine, Structured Concurrency


## Xcode build

1. Unzip LloydsAssignment.zip
2. Open `LloydsAssignment.xcodeproj` in Xcode
3. Select the `LloydsAssignment` scheme
4. Build

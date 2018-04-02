<?php
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/
Route::get('/',function(){
    return response()->json(['message'=>'alive...'],200);
});

// -----------------------
// For Authentication
Route::post('v1/sessions/login', ['uses'=>'SessionsController@login','as'=>'v1.sessions.login']);
Route::get('v1/sessions/logout', ['uses'=>'SessionsController@logout','as'=>'v1.sessions.logout']);
Route::get('v1/sessions/access', ['uses'=>'SessionsController@access','as'=>'v1.sessions.access']);
// -----------------------
$router->group(['before'=>'oauth', 'prefix'=>'v1', 'middleware'=>['auth']],function(){
    // -----------------------
    Route::get('catalogs',['as'=>'v1.utilities.catalogs','uses'=>'UtilitiesController@getCatalogs']);
    // -----------------------
    Route::get('bodyparts/search',['as'=>'v1.bodyparts.search', 'uses'=>'BodyPartsController@search','resource'=>'Body Parts','write'=>0]);
    Route::match(['POST','PUT','PATCH','DELETE'],'bodyparts/search',['as'=>'v1.bodyparts.invalid','uses'=>'UtilitiesController@invalidResponse']);
    Route::get('bodyparts',['as'=>'v1.bodyparts.index', 'uses'=>'BodyPartsController@index','resource'=>'Body Parts','write'=>0]);
    Route::get('bodyparts/{id}',['as'=>'v1.bodyparts.show', 'uses'=>'BodyPartsController@show','resource'=>'Body Parts','write'=>0]);
    Route::post('bodyparts',['as'=>'v1.bodyparts.store', 'uses'=>'BodyPartsController@store','resource'=>'Body Parts','write'=>1]);
    Route::put('bodyparts/{id}',['as'=>'v1.bodyparts.update', 'uses'=>'BodyPartsController@update','resource'=>'Body Parts','write'=>1]);
    Route::delete('bodyparts/{id}',['as'=>'v1.bodyparts.destroy', 'uses'=>'BodyPartsController@destroy','resource'=>'Body Parts','write'=>1]);
    Route::delete('bodyparts',['as'=>'v1.bodyparts.massivedestroy', 'uses'=>'BodyPartsController@massiveDestroy','resource'=>'Body Parts','write'=>1]);
    // -----------------------
    Route::get('regions/search',['as'=>'v1.regions.search', 'uses'=>'RegionsController@search','resource'=>'Regions','write'=>0]);
    Route::match(['POST','PUT','PATCH','DELETE'],'regions/search',['as'=>'v1.regions.invalid','uses'=>'UtilitiesController@invalidResponse']);
    Route::get('regions',['as'=>'v1.regions.index', 'uses'=>'RegionsController@index','resource'=>'Regions','write'=>0]);
    Route::get('regions/{id}',['as'=>'v1.regions.show', 'uses'=>'RegionsController@show','resource'=>'Regions','write'=>0]);
    Route::get('regions/cities',['as'=>'v1.regions.cities', 'uses'=>'RegionsController@getCities','resource'=>'Regions','write'=>0]);
    Route::get('regions/county/{id}',['as'=>'v1.regions.county.show', 'uses'=>'RegionsController@getRegionsByCounty','resource'=>'Regions','write'=>0]);
    Route::post('regions',['as'=>'v1.regions.store', 'uses'=>'RegionsController@store','resource'=>'Regions','write'=>1]);
    Route::put('regions/{id}',['as'=>'v1.regions.update', 'uses'=>'RegionsController@update','resource'=>'Regions','write'=>1]);
    Route::delete('regions/{id}',['as'=>'v1.regions.destroy', 'uses'=>'RegionsController@destroy','resource'=>'Regions','write'=>1]);
    Route::delete('regions',['as'=>'v1.regions.massivedestroy', 'uses'=>'RegionsController@massiveDestroy','resource'=>'Regions','write'=>1]);
    // -----------------------
    Route::get('confirmations/search/',['as'=>'v1.confirmations.search','uses'=>'ConfirmationsController@search','resource'=>'Confirmations','write'=>0]);
    Route::match(['POST','PUT','PATCH','DELETE'],'confirmations/search',['as'=>'v1.confirmations.invalid','uses'=>'UtilitiesController@invalidResponse']);
    Route::get('confirmations',['as'=>'v1.confirmations.index','uses'=>'ConfirmationsController@index','resource'=>'Confirmations','write'=>0]);
    Route::get('confirmations/{id}',['as'=>'v1.confirmations.show','uses'=>'ConfirmationsController@show','resource'=>'Confirmations','write'=>0]);
    Route::post('confirmations',['as'=>'v1.confirmations.store','uses'=>'ConfirmationsController@store','resource'=>'Confirmations','write'=>1]);
    Route::put('confirmations/{id}',['as'=>'v1.confirmations.update','uses'=>'ConfirmationsController@update','resource'=>'Confirmations','write'=>1]);
    Route::delete('confirmations/{id}',['as'=>'v1.confirmations.destroy','uses'=>'ConfirmationsController@destroy','resource'=>'Confirmations','write'=>1]);
    Route::delete('confirmations',['as'=>'v1.confirmations.massivedestroy','uses'=>'ConfirmationsController@massiveDestroy','resource'=>'Confirmations','write'=>1]);
    // -----------------------
    Route::get('cancelations/search',['as'=>'v1.cancelations.search','uses'=>'CancelationsController@search','resource'=>'Cancelations','write'=>0]);
    Route::match(['POST','PUT','PATCH','DELETE'],'cancelations/search',['as'=>'v1.cancelations.invalid','uses'=>'UtilitiesController@invalidResponse']);
    Route::get('cancelations',['as'=>'v1.cancelations.index','uses'=>'CancelationsController@index','resource'=>'Cancelations','write'=>0]);
    Route::get('cancelations/{id}',['as'=>'v1.cancelations.show','uses'=>'CancelationsController@show','resource'=>'Cancelations','write'=>0]);
    Route::post('cancelations',['as'=>'v1.cancelations.store','uses'=>'CancelationsController@store','resource'=>'Cancelations','write'=>1]);
    Route::put('cancelations/{id}',['as'=>'v1.cancelations.update','uses'=>'CancelationsController@update','resource'=>'Cancelations','write'=>1]);
    Route::delete('cancelations/{id}',['as'=>'v1.cancelations.destroy','uses'=>'CancelationsController@destroy','resource'=>'Cancelations','write'=>1]);
    Route::delete('cancelations',['as'=>'v1.cancelations.massivedestroy','uses'=>'CancelationsController@massiveDestroy','resource'=>'Cancelations','write'=>1]);
    // -----------------------
    Route::get('lawoffices/search',['as'=>'v1.lawoffices.search','uses'=>'LawOfficesController@search','resource'=>'Law Offices','write'=>0]);
    Route::match(['POST','PUT','PATCH','DELETE'],'lawoffices/search',['as'=>'v1.lawoffices.invalid','uses'=>'UtilitiesController@invalidResponse']);
    Route::get('lawoffices/{id}/attorneys',['as'=>'v1.lawoffices.attorneys','uses'=>'LawOfficesController@attorneys','resource'=>'Law Offices','write'=>0]);
    Route::get('lawoffices',['as'=>'v1.lawoffices.index','uses'=>'LawOfficesController@index','resource'=>'Law Offices','write'=>0]);
    Route::get('lawoffices/{id}',['as'=>'v1.lawoffices.show','uses'=>'LawOfficesController@show','resource'=>'Law Offices','write'=>0]);
    Route::post('lawoffices',['as'=>'v1.lawoffices.store','uses'=>'LawOfficesController@store','resource'=>'Law Offices','write'=>1]);
    Route::put('lawoffices/{id}',['as'=>'v1.lawoffices.update','uses'=>'LawOfficesController@update','resource'=>'Law Offices','write'=>1]);
    Route::delete('lawoffices/{id}',['as'=>'v1.lawoffices.destroy','uses'=>'LawOfficesController@destroy','resource'=>'Law Offices','write'=>1]);
    Route::delete('lawoffices',['as'=>'v1.lawoffices.massivedestroy','uses'=>'LawOfficesController@massiveDestroy','resource'=>'Law Offices','write'=>1]);
    // -----------------------
    Route::get('clinics/search',['as'=>'v1.clinics.search','uses'=>'ClinicsController@search','resource'=>'Clinics','write'=>0]);
    Route::match(['POST','PUT','PATCH','DELETE'],'clinics/search',['as'=>'v1.clinics.invalid','uses'=>'UtilitiesController@invalidResponse']);
    Route::get('clinics/{id}/doctors',['as'=>'v1.clinics.doctors','uses'=>'ClinicsController@doctors','resource'=>'Clinics','write'=>0]);
    Route::get('clinics',['as'=>'v1.clinics.index','uses'=>'ClinicsController@index','resource'=>'Clinics','write'=>0]);
    Route::get('clinics/{id}',['as'=>'v1.clinics.show','uses'=>'ClinicsController@show','resource'=>'Clinics','write'=>0]);
    Route::post('clinics',['as'=>'v1.clinics.store','uses'=>'ClinicsController@store','resource'=>'Clinics','write'=>1]);
    Route::put('clinics/{id}',['as'=>'v1.clinics.update','uses'=>'ClinicsController@update','resource'=>'Clinics','write'=>1]);
    Route::delete('clinics/{id}',['as'=>'v1.clinics.destroy','uses'=>'ClinicsController@destroy','resource'=>'Clinics','write'=>1]);
    Route::delete('clinics',['as'=>'v1.clinics.massivedestroy','uses'=>'ClinicsController@massiveDestroy','resource'=>'Clinics','write'=>1]);
    // -----------------------
    Route::get('insurancecompanies/search',['as'=>'v1.insurancecompanies.search','uses'=>'InsuranceCompaniesController@search','resource'=>'Insurance Companies','write'=>0]);
    Route::match(['POST','PUT','PATCH','DELETE'],'insurancecompanies/search',['as'=>'v1.insurancecompanies.invalid','uses'=>'UtilitiesController@invalidResponse']);
    Route::get('insurancecompanies',['as'=>'v1.insurancecompanies.index','uses'=>'InsuranceCompaniesController@index','resource'=>'Insurance Companies','write'=>0]);
    Route::get('insurancecompanies/{id}',['as'=>'v1.insurancecompanies.show','uses'=>'InsuranceCompaniesController@show','resource'=>'Insurance Companies','write'=>0]);
    Route::get('insurancecompanies/{id}/login',['as'=>'v1.insurancecompanies.login','uses'=>'InsuranceCompaniesController@getLogin','resource'=>'Insurance Companies','write'=>0]);
    Route::post('insurancecompanies',['as'=>'v1.insurancecompanies.store','uses'=>'InsuranceCompaniesController@store','resource'=>'Insurance Companies','write'=>1]);
    Route::put('insurancecompanies/{id}',['as'=>'v1.insurancecompanies.update','uses'=>'InsuranceCompaniesController@update','resource'=>'Insurance Companies','write'=>1]);
    Route::delete('insurancecompanies/{id}',['as'=>'v1.insurancecompanies.destroy','uses'=>'InsuranceCompaniesController@destroy','resource'=>'Insurance Companies','write'=>1]);
    Route::delete('insurancecompanies',['as'=>'v1.insurancecompanies.massivedestroy','uses'=>'InsuranceCompaniesController@massiveDestroy','resource'=>'Insurance Companies','write'=>1]);
    // -----------------------
    Route::get('attorneys/search',['as'=>'v1.attorneys.search','uses'=>'AttorneysController@search','resource'=>'Attorneys','write'=>0]);
    Route::match(['POST','PUT','PATCH','DELETE'],'attorneys/search',['as'=>'v1.attorneys.invalid','uses'=>'UtilitiesController@invalidResponse']);
    Route::get('attorneys/{id}/lawoffice',['as'=>'v1.attorneys.lawoffice','uses'=>'AttorneysController@lawoffice','resource'=>'Attorneys','write'=>0]);
    Route::get('attorneys',['as'=>'v1.attorneys.index','uses'=>'AttorneysController@index','resource'=>'Attorneys','write'=>0]);
    Route::get('attorneys/{id}',['as'=>'v1.attorneys.show','uses'=>'AttorneysController@show','resource'=>'Attorneys','write'=>0]);
    Route::post('attorneys',['as'=>'v1.attorneys.store','uses'=>'AttorneysController@store','resource'=>'Attorneys','write'=>1]);
    Route::put('attorneys/{id}',['as'=>'v1.attorneys.update','uses'=>'AttorneysController@update','resource'=>'Attorneys','write'=>1]);
    Route::delete('attorneys/{id}',['as'=>'v1.attorneys.destroy','uses'=>'AttorneysController@destroy','resource'=>'Attorneys','write'=>1]);
    Route::delete('attorneys',['as'=>'v1.attorneys.massivedestroy','uses'=>'AttorneysController@massiveDestroy','resource'=>'Attorneys','write'=>1]);
    // -----------------------
    Route::get('doctors/search',['as'=>'v1.doctors.search','uses'=>'DoctorsController@search','resource'=>'Doctors','write'=>0]);
    Route::match(['POST','PUT','PATCH','DELETE'],'doctors/search',['as'=>'v1.doctors.invalid','uses'=>'UtilitiesController@invalidResponse']);
    Route::get('doctors/{id}/clinic',['as'=>'v1.doctors.clinic','uses'=>'DoctorsController@Clinic','resource'=>'Doctors','write'=>0]);
    Route::get('doctors',['as'=>'v1.doctors.index','uses'=>'DoctorsController@index','resource'=>'Doctors','write'=>0]);
    Route::get('doctors/{id}',['as'=>'v1.doctors.show','uses'=>'DoctorsController@show','resource'=>'Doctors','write'=>0]);
    Route::post('doctors',['as'=>'v1.doctors.store','uses'=>'DoctorsController@store','resource'=>'Doctors','write'=>1]);
    Route::put('doctors/{id}',['as'=>'v1.doctors.update','uses'=>'DoctorsController@update','resource'=>'Doctors','write'=>1]);
    Route::delete('doctors/{id}',['as'=>'v1.doctors.destroy','uses'=>'DoctorsController@destroy','resource'=>'Doctors','write'=>1]);
    Route::delete('doctors',['as'=>'v1.doctors.massivedestroy','uses'=>'DoctorsController@massiveDestroy','resource'=>'Doctors','write'=>1]);
    // -----------------------
    Route::get('clients/search',['as'=>'v1.clients.search', 'uses'=>'ClientsController@search','resource'=>'Clients','write'=>0]);
    Route::match(['POST','PUT','PATCH','DELETE'],'clients/search',['as'=>'v1.clients.invalid','uses'=>'UtilitiesController@invalidResponse']);
    Route::get('clients',['as'=>'v1.clients.index', 'uses'=>'ClientsController@index','resource'=>'Clients','write'=>0]);
    Route::get('clients/{id}',['as'=>'v1.clients.show', 'uses'=>'ClientsController@show','resource'=>'Clients','write'=>0]);
    Route::post('clients',['as'=>'v1.clients.store', 'uses'=>'ClientsController@store','resource'=>'Clients','write'=>1]);
    Route::put('clients/{id}',['as'=>'v1.clients.update', 'uses'=>'ClientsController@update','resource'=>'Clients','write'=>1]);
    Route::delete('clients/{id}',['as'=>'v1.clients.destroy', 'uses'=>'ClientsController@destroy','resource'=>'Clients','write'=>1]);

    Route::get('clients/{id}/passengers/search',['as'=>'v1.clients.passengers.search', 'uses'=>'PassengersController@search','resource'=>'Clients','write'=>0]);
    Route::match(['POST','PUT','PATCH','DELETE'],'clients/{id}/passengers/search',['as'=>'v1.clients.passengers.invalid','uses'=>'UtilitiesController@invalidResponse']);
    Route::get('clients/{id}/passengers',['as'=>'v1.clients.passengers.index', 'uses'=>'PassengersController@index','resource'=>'Clients','write'=>0]);
    Route::get('clients/{id}/passengers/{passengers}',['as'=>'v1.clients.passengers.show', 'uses'=>'PassengersController@show','resource'=>'Clients','write'=>0]);
    Route::post('clients/{id}/passengers',['as'=>'v1.clients.passengers.store', 'uses'=>'PassengersController@store','resource'=>'Clients','write'=>1]);
    Route::put('clients/{id}/passengers/{passengers}',['as'=>'v1.clients.passengers.update', 'uses'=>'PassengersController@update','resource'=>'Clients','write'=>1]);
    Route::delete('clients/{id}/passengers/{passengers}',['as'=>'v1.clients.passengers.destroy', 'uses'=>'PassengersController@destroy','resource'=>'Clients','write'=>1]);
    // -----------------------
    Route::get('users/search',['as'=>'v1.users.search', 'uses'=>'UsersController@search','resource'=>'Users','write'=>0]);
    Route::match(['POST','PUT','PATCH','DELETE'],'users/search',['as'=>'v1.users.invalid','uses'=>'UtilitiesController@invalidResponse']);
    Route::get('users',['as'=>'v1.users.index', 'uses'=>'UsersController@index','resource'=>'Users','write'=>0]);
    Route::get('users/{id}',['as'=>'v1.users.show', 'uses'=>'UsersController@show','resource'=>'Users','write'=>0]);
    Route::post('users',['as'=>'v1.users.store', 'uses'=>'UsersController@store','resource'=>'Users','write'=>1]);
    Route::put('users/{id}',['as'=>'v1.users.update', 'uses'=>'UsersController@update','resource'=>'Users','write'=>1]);
    Route::delete('users/{id}',['as'=>'v1.users.destroy', 'uses'=>'UsersController@destroy','resource'=>'Users','write'=>1]);

    Route::get('users/{id}/roles/search',['as'=>'v1.users.roles.search', 'uses'=>'RolesController@search','resource'=>'Users','write'=>0]);
    Route::match(['POST','PUT','PATCH','DELETE'],'users/{id}/roles/search',['as'=>'v1.users.roles.invalid','uses'=>'UtilitiesController@invalidResponse']);
    Route::get('users/{id}/roles',['as'=>'v1.users.roles.index', 'uses'=>'RolesController@index','resource'=>'Users','write'=>0]);
    Route::get('users/{id}/roles/{roles}',['as'=>'v1.users.roles.show', 'uses'=>'RolesController@show','resource'=>'Users','write'=>0]);
    Route::post('users/{id}/roles',['as'=>'v1.users.roles.store', 'uses'=>'RolesController@store','resource'=>'Users','write'=>1]);
    Route::put('users/{id}/roles/{roles}',['as'=>'v1.users.roles.update', 'uses'=>'RolesController@update','resource'=>'Users','write'=>1]);
    Route::delete('users/{id}/roles/{roles}',['as'=>'v1.users.roles.destroy', 'uses'=>'RolesController@destroy','resource'=>'Users','write'=>1]);
    Route::delete('users/{id}/roles',['as'=>'v1.users.roles.deletemany', 'uses'=>'RolesController@deleteMany','resource'=>'Users','write'=>1]);

    // Search routes
    Route::post('search',['as'=>'v1.search.index','uses'=>'SearchController@search','resource'=>'Searches','write'=>0]);
    Route::get('search/fields',['as'=>'v1.search.fields','uses'=>'SearchController@getFields','resource'=>'Searches','write'=>0]);
    Route::get('reports',['as'=>'v1.reports.index','uses'=>'SearchController@index','resource'=>'Reports','write'=>0]);
    Route::post('reports/default',['as'=>'v1.reports.default','uses'=>'SearchController@getDefaultReport','resource'=>'Reports','write'=>0]);
    Route::get('reports/{id}',['as'=>'v1.reports.show','uses'=>'SearchController@show','resource'=>'Reports','write'=>0]);
    Route::post('reports',['as'=>'v1.reports.store','uses'=>'SearchController@store','resource'=>'Reports','write'=>1]);
    Route::put('reports/{id}',['as'=>'v1.reports.update','uses'=>'SearchController@update','resource'=>'Reports','write'=>1]);
    Route::post('reports/display/{id}',['as'=>'v1.reports.display','uses'=>'SearchController@showReport','resource'=>'Reports','write'=>0]);
    Route::delete('reports/{id}',['as'=>'v1.reports.delete','uses'=>'SearchController@destroy','resource'=>'Reports','write'=>1]);
    Route::get('reports/export/{id}',['as'=>'v1.reports.export','uses'=>'SearchController@exportReport','resource'=>'Reports','write'=>0]);
    Route::get('reports/print/{id}',['as'=>'v1.reports.print','uses'=>'SearchController@printReport','resource'=>'Reports','write'=>0]);

    // Mailing routes
    Route::post('mail',['as'=>'v1.mail.send','uses'=>'MailController@sendMessage']);
});
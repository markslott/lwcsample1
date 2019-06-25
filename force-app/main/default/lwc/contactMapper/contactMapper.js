import { LightningElement, track, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactMapperController.getContacts';

export default class ContactMapper extends LightningElement {

    @track mapMarkers = [];

    @wire(getContacts) salesforceContacts; 

    xform = contacts => {
        var markers = [];
        for (let contact of contacts) {
            let marker = {
                location : {
                    City : contact.MailingCity,
                    Country : contact.MailingCountry,
                    PostalCode : contact.MailingPostalCode,
                    State : contact.MailingState,
                    Street : contact.MailingStreet
                },
                title : contact.FirstName + ' ' + contact.LastName,
                icon : 'standard:contact' 
            }
            markers.push(marker);
        }
        return markers;
    }

    getSelectedName = event => {
        const selectedRows = event.detail.selectedRows;
        this.mapMarkers=this.xform(selectedRows);
    }

    /*async connectedCallback() {
        const data = await dataHelper();
        this.data = data;
    }*/

    columns = [
        { label: 'First Name', fieldName: 'FirstName' },
        { label: 'Last Name', fieldName: 'LastName' },
        { label: 'Phone', fieldName: 'Phone', type: 'phone' },
        { label: 'Email', fieldName: 'Email' },
        { label: 'Zip Code', fieldName: 'MailingPostalCode' },
    ];
}

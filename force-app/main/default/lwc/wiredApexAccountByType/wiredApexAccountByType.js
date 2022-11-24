import { LightningElement, wire } from 'lwc';
import getAccountsByType from '@salesforce/apex/AccountCtrl.getAccountsByType';



export default class WiredApexAccountByType extends LightningElement {
    accountType = "Prospect";
    accounts;

    @wire(getAccountsByType, {type: '$accountType'})    //classin import name ini method name ini yaziyoruz bir function a atiyoruz Data geldiyse accounts degiskeninin icine atiyor biz bunu datatable (HTML de kullandigimiz bir componenet)da kullanabiliiirz.   
    accountHandler({data, error}) {
        if(data) {
            console.log(data);
            this.accounts = data;
        }
        if(error) {
            console.log(error);
        }
    }
}

//bu bir datatable ornegi  https://developer.salesforce.com/docs/component-library/bundle/lightning-datatable/example bu linki incele 
// <template>
//{/* <div style="height: 300px;">
/* <lightning-datatable
        key-field="id"
        data={data}
        columns={columns}>
</lightning-datatable>
</div>
</template> */

//
// Taner
// 9:09 PM
// @channel iyi dersler. apex code ile nasıl data çekeriz konusuyla başbaşayız.
// wire function ile = apex code sayesinde wire ın çalışma zamanında data çektiğimiz yöntem
// İmperative= apex code vasıtasıyla istediğimiz zamanda (event) çalışarak data çektiğimiz yöntem. wire’dan farkı DML de yapılabiliyor olması.
// Bu aşamada Apex kullanırken,
// AuraEnabled(cacheable=true/false)
// AuraEnabled=Yazılan apex methodunu LWC tarafından kullanılabilir hale getirmek için kullandığımız ifade.
// cacheable=true/false ifadesi ise client-side da  yani kullanıcının cihazında LDS ile kaydedilsin mi? kaydedilmesin mi? konusununda seçim yapmak için kullanırız. Yani “true” olursa sizin cache’inize bu veriler kaydedilir ve oradan kullanılır. Ve wire function da bu değer “true” olmalıdır. İmperative de seçebiliriz.